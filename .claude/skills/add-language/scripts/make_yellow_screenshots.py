"""Builds the yellow App Store screenshots of one locale.

Usage:
  python make_yellow_screenshots.py --src <dir> --out fastlane/screenshots/<locale> \
      --captions captions.json --font <font.ttf> [--variation Black] [--review review.png]

captions.json holds two lines per headline, keyed by the screenshot index, and
optionally the one-line headlines of the iPhone Duo landscape shots (3-5),
which otherwise join the two lines with a space:
  {"0": ["...", "..."], "1": ["...", "..."], "2": ["...", "..."],
   "landscape": {"0": "...", "1": "...", "2": "..."}}

A yellow source (such as en-US) only gets its headline replaced. A dark source
(the old design) is rebuilt: the device is cut out, enlarged and placed so that
only its upper part shows below the headline.
"""

import argparse
import json
import unicodedata
from pathlib import Path

import numpy as np
from PIL import Image, ImageDraw, ImageFont

YELLOW, NAVY = (251, 191, 36), (15, 23, 42)
BORDER = np.array([40, 46, 62])  # outer ring of the device frames
# Device placement and headline box per screenshot type. size is the largest
# font size; it shrinks for the whole type until the widest line fits width.
LAYOUTS = {
    "IPHONE_67": dict(tl=116, tw=1058, tt=705, cy=368, size=150, width=1200, lines=2),
    "IPAD_PRO_3GEN_129": dict(tl=206, tw=1652, tt=860, cy=470, size=230, width=1900, lines=2),
    "IPHONE_DUO_P": dict(tl=126, tw=1146, tt=620, cy=332, size=156, width=1300, lines=2),
    "IPHONE_DUO_L": dict(tl=226, tw=2400, tt=460, cy=240, size=176, width=2630, lines=1),
}
# Device frame in the dark sources: left, right (None when it runs off the
# right edge; it then keeps the scale of reference width ref) and the probe row.
FRAMES = {
    "0_APP_IPHONE_67_0": ("IPHONE_67", 233, 1056, 1800),
    "1_APP_IPHONE_67_1": ("IPHONE_67", 43, 1246, 1400),
    "2_APP_IPHONE_67_2": ("IPHONE_67", 233, 1056, 1300),
    "0_APP_IPAD_PRO_3GEN_129_0": ("IPAD_PRO_3GEN_129", 312, 1751, 1376),
    "1_APP_IPAD_PRO_3GEN_129_1": ("IPAD_PRO_3GEN_129", 40, None, 1376),
    "2_APP_IPAD_PRO_3GEN_129_2": ("IPAD_PRO_3GEN_129", 312, 1751, 1376),
    "0_APP_IPHONE_DUO_0": ("IPHONE_DUO_P", 223, 1173, 1017),
    "1_APP_IPHONE_DUO_1": ("IPHONE_DUO_P", 49, 1348, 1017),
    "2_APP_IPHONE_DUO_2": ("IPHONE_DUO_P", 223, 1173, 1017),
    "3_APP_IPHONE_DUO_3": ("IPHONE_DUO_L", 397, 2455, 1003),
    "4_APP_IPHONE_DUO_4": ("IPHONE_DUO_L", 100, 2752, 1003),
    "5_APP_IPHONE_DUO_5": ("IPHONE_DUO_L", 397, 2455, 1003),
}
BLEED_REF = {"IPAD_PRO_3GEN_129": 1440}

args = argparse.ArgumentParser()
args.add_argument("--src", required=True)
args.add_argument("--out", required=True)
args.add_argument("--captions", required=True)
args.add_argument("--font", required=True)
args.add_argument("--variation")
args.add_argument("--review")
args = args.parse_args()

raw = json.load(open(args.captions, encoding="utf-8"))
nfc = lambda t: unicodedata.normalize("NFC", t)
two = {int(k): [nfc(t) for t in v] for k, v in raw.items() if k.isdigit()}
one = {int(k): nfc(v) for k, v in raw.get("landscape", {}).items()}
src, out = Path(args.src), Path(args.out)
out.mkdir(parents=True, exist_ok=True)


def font(size):
    f = ImageFont.truetype(args.font, round(size), layout_engine=ImageFont.Layout.RAQM)
    if args.variation:
        f.set_variation_by_name(args.variation)
    return f


def headline(name):
    key = int(name.split("_")[0]) % 3
    if FRAMES[name][0] != "IPHONE_DUO_L":
        return two[key]
    return [one.get(key, " ".join(two[key]))]


def ink(f, text):
    """Ink bounds relative to the middle of the line."""
    return ImageDraw.Draw(Image.new("L", (1, 1))).textbbox((0, 0), text, font=f, anchor="mm")


def group_size(group):
    g = LAYOUTS[group]
    texts = [t for n in FRAMES if FRAMES[n][0] == group for t in headline(n)]
    widest = max(ink(font(100), t)[2] - ink(font(100), t)[0] for t in texts)
    return min(g["size"], 100 * g["width"] / widest)


def place_device(name, a, canvas):
    group, left, right, probe = FRAMES[name]
    g = LAYOUTS[group]
    h, w, _ = a.shape
    like = np.abs(a - BORDER).sum(axis=2) < 16
    bleed = right is None
    right = w - 1 if bleed else right
    if not like[probe, left]:
        raise SystemExit(f"{name}: no device frame at x={left}; the source layout changed")
    # The top edge is a full horizontal run; headline anti-aliasing only matches in spots.
    top = int(np.where(like[300:1300, left + 200:left + 300].all(axis=1))[0].min()) + 300
    scale = g["tw"] / (BLEED_REF[group] if bleed else right - left + 1)
    rows, cols = h - top, right - left + 1
    mask = np.zeros((rows, cols), dtype=np.uint8)
    pl = pr = 400
    for k in range(rows):
        if k < 300:  # rounded top corners: keep only what lies inside the frame
            hit = np.where(like[top + k, left:left + 400])[0]
            pl = min(pl, int(hit.min())) if len(hit) else pl
            hit = np.where(like[top + k, right - 399:right + 1])[0]
            pr = min(pr, 399 - int(hit.max())) if len(hit) and not bleed else (0 if bleed else pr)
        else:
            pl = pr = 0
        mask[k, pl:cols - pr] = 255
    size = (round(cols * scale), round(rows * scale))
    phone = Image.fromarray(a[top:, left:right + 1].astype(np.uint8)).resize(size, Image.LANCZOS)
    m = Image.fromarray(mask).resize(size, Image.LANCZOS)
    canvas.paste(phone, (g["tl"], g["tt"]), m)
    bottom = g["tt"] + size[1]
    if bottom < canvas.height:  # the source fades out early: stretch its last row down
        ext = (size[0], canvas.height - bottom + 2)
        last = (0, size[1] - 1, size[0], size[1])
        canvas.paste(phone.crop(last).resize(ext), (g["tl"], bottom - 2), m.crop(last).resize(ext))


def draw_headline(name, canvas, size):
    g = LAYOUTS[FRAMES[name][0]]
    f = font(size)
    texts = headline(name)
    boxes = [ink(f, t) for t in texts]
    step = 1.333 * size
    for upper, lower in zip(boxes, boxes[1:]):
        step = max(step, upper[3] - lower[1] + 0.12 * size)
    middles = [g["cy"] + (i - (len(texts) - 1) / 2) * step for i in range(len(texts))]
    if middles[0] + boxes[0][1] < 60 or middles[-1] + boxes[-1][3] > g["tt"] - 60:
        print(f"  warning: {name} headline is taller than its box")
    d = ImageDraw.Draw(canvas)
    for y, t in zip(middles, texts):
        d.text((canvas.width / 2, y), t, font=f, fill=NAVY, anchor="mm")


sizes = {group: group_size(group) for group in LAYOUTS}
for group, size in sizes.items():
    print(f"{group}: {size:.0f}px ({size / LAYOUTS[group]['size']:.0%} of the largest size)")
results = []
for name in FRAMES:
    source = Image.open(src / f"{name}.png").convert("RGB")
    a = np.asarray(source).astype(int)
    if tuple(a[10, 10]) == YELLOW:
        canvas = source.copy()
        ImageDraw.Draw(canvas).rectangle((0, 0, canvas.width, LAYOUTS[FRAMES[name][0]]["tt"] - 20), fill=YELLOW)
    else:
        canvas = Image.new("RGB", source.size, YELLOW)
        place_device(name, a, canvas)
    draw_headline(name, canvas, sizes[FRAMES[name][0]])
    canvas.save(out / f"{name}.png", optimize=True)
    results.append(canvas)

if args.review:
    rows = [results[i:i + 3] for i in (0, 3, 6)] + [results[9:12]]
    tiles = [[im.resize((round(im.width * 600 / im.height), 600)) for im in row] for row in rows]
    sheet = Image.new("RGB", (max(sum(t.width + 12 for t in row) for row in tiles), 600 * 4 + 36), "white")
    for y, row in enumerate(tiles):
        x = 0
        for t in row:
            sheet.paste(t, (x, y * 612))
            x += t.width + 12
    sheet.save(args.review)
    print(f"review sheet: {args.review}")

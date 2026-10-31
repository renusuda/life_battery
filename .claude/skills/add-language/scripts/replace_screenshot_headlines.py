"""Copies the en-US App Store screenshots with their headlines translated.

Usage:
  python replace_screenshot_headlines.py --poppins Poppins-Bold.ttf \
      --font <target font> [--variation Bold] \
      --captions captions.json --src fastlane/screenshots/en-US \
      --out fastlane/screenshots/<locale> [--review review.png]

captions.json holds two lines per headline, keyed by the screenshot index:
  {"0": ["...", "..."], "1": ["...", "..."], "2": ["...", "..."]}
The iPhone Duo landscape screenshots (3-5) join the two lines into one.

Only the headline area changes. The background behind it is a vertical
gradient, so each row is refilled by blending the colors just left and right
of the old text before the new headline is drawn.
"""

import argparse
import json
import sys
import unicodedata
from pathlib import Path

import numpy as np
from PIL import Image, ImageDraw, ImageFont, features

# The en-US headlines, used to measure the original font size and baselines.
EN = {
    0: ["What % of your", "life is left?"],
    1: ["Always on your", "Home Screen"],
    2: ["Just birth date", "and ideal lifespan"],
}
TEXT_COLOR = (245, 247, 250)
# (file pattern, screenshot indices or None for all, lines per headline)
GROUPS = {
    "iPhone 6.7": ("*_APP_IPHONE_67_*.png", None, 2),
    "iPad 13": ("*_APP_IPAD_PRO_3GEN_129_*.png", None, 2),
    "iPhone Duo portrait": ("*_APP_IPHONE_DUO_*.png", {0, 1, 2}, 2),
    "iPhone Duo landscape": ("*_APP_IPHONE_DUO_*.png", {3, 4, 5}, 1),
}
# Hebrew, Arabic, Indic, Thai and Lao glyphs change shape or position with
# their neighbors, which only Pillow's Raqm layout handles.
SHAPED_RANGES = [(0x0590, 0x08FF), (0x0900, 0x0DFF), (0x0E00, 0x0EFF), (0xFB1D, 0xFDFF), (0xFE70, 0xFEFF)]

args = argparse.ArgumentParser()
args.add_argument("--poppins", required=True)
args.add_argument("--font", required=True)
args.add_argument("--variation")
args.add_argument("--captions", required=True)
args.add_argument("--src", required=True)
args.add_argument("--out", required=True)
args.add_argument("--review")
args = args.parse_args()

captions = {int(k): [unicodedata.normalize("NFC", t) for t in v] for k, v in json.load(open(args.captions, encoding="utf-8")).items()}
needs_shaping = any(lo <= ord(c) <= hi for texts in captions.values() for c in "".join(texts) for lo, hi in SHAPED_RANGES)
if needs_shaping and not features.check("raqm"):
    sys.exit("These captions need text shaping. Install FriBiDi and libraqm (brew install fribidi libraqm) so Pillow can use Raqm.")
layout = ImageFont.Layout.RAQM if needs_shaping else ImageFont.Layout.BASIC
src, out = Path(args.src), Path(args.out)
out.mkdir(parents=True, exist_ok=True)


def poppins(size):
    return ImageFont.truetype(args.poppins, size)


def target(size):
    font = ImageFont.truetype(args.font, size, layout_engine=layout)
    if args.variation:
        font.set_variation_by_name(args.variation)
    return font


def cap_height(font):
    return -font.getbbox("H", anchor="ls")[1]


def ink_box(font, text):
    """Ink bounds relative to the center of the baseline."""
    img = Image.new("L", (int(font.size * len(text)) + 400, int(font.size * 3)), 0)
    ImageDraw.Draw(img).text((img.width / 2, font.size * 2), text, font=font, fill=255, anchor="ms")
    ys, xs = np.where(np.asarray(img) > 0)
    return xs.min() - img.width / 2, ys.min() - font.size * 2, xs.max() - img.width / 2, ys.max() - font.size * 2


def lines(texts, n):
    return texts if n == 2 else [" ".join(texts)]


def headline_rows(a, n):
    lum = a.mean(axis=2)
    rows = np.where((lum[: int(a.shape[0] * 0.3)] > 128).any(axis=1))[0]
    groups, start, prev = [], rows[0], rows[0]
    for r in rows[1:]:
        if r != prev + 1:
            groups.append((start, prev))
            start = r
        prev = r
    groups.append((start, prev))
    return [g for g in groups if g[1] - g[0] > 40][:n]


def ink_width(font, text):
    box = ink_box(font, text)
    return box[2] - box[0]


review_tiles = []
for label, (pattern, indices, n) in GROUPS.items():
    shots = []
    for path in sorted(src.glob(pattern)):
        index = int(path.name.split("_")[0])
        if indices is not None and index not in indices:
            continue
        a = np.asarray(Image.open(path).convert("RGB")).astype(np.float64)
        rows = headline_rows(a, n)
        lum = a.mean(axis=2)
        widths = [np.ptp(np.where((lum[r0:r1 + 1] > 128).any(axis=0))[0]) + 1 for r0, r1 in rows]
        shots.append((path, a, index % 3, rows, widths))
    if not shots:
        continue

    sizes = []
    for _, _, key, _, widths in shots:
        for text, width in zip(lines(EN[key], n), widths):
            lo, hi = 20.0, 400.0
            for _ in range(30):
                mid = (lo + hi) / 2
                lo, hi = (mid, hi) if ink_width(poppins(mid), text) < width else (lo, mid)
            sizes.append((lo + hi) / 2)
    en_size = float(np.median(sizes))
    max_width = max(max(widths) for *_, widths in shots)
    size = en_size
    for _ in range(25):
        size *= cap_height(poppins(en_size)) / cap_height(target(size))
    widest = max(ink_width(target(size), t) for k in captions for t in lines(captions[k], n))
    if widest > max_width:
        size *= max_width / widest
    print(f"{label}: en {en_size:.1f}px -> {size:.1f}px")

    for path, a, key, rows, _ in shots:
        a = a.copy()
        cx = a.shape[1] / 2
        baselines = [r0 - ink_box(poppins(en_size), text)[1] for (r0, _), text in zip(rows, lines(EN[key], n))]
        lum = a.mean(axis=2)
        old_cols = np.where((lum[rows[0][0]: rows[-1][1] + 1] > 40).any(axis=0))[0]
        new_lines = lines(captions[key], n)
        boxes = [ink_box(target(size), t) for t in new_lines]
        pad = 10
        top = int(min(rows[0][0], min(b + box[1] for b, box in zip(baselines, boxes)))) - pad
        bottom = int(max(rows[-1][1], max(b + box[3] for b, box in zip(baselines, boxes)))) + pad
        left = int(min(old_cols.min(), cx + min(box[0] for box in boxes))) - pad
        right = int(max(old_cols.max(), cx + max(box[2] for box in boxes))) + pad
        for r in range(top, bottom + 1):
            left_color = a[r, left - 12: left - 2].mean(axis=0)
            right_color = a[r, right + 2: right + 12].mean(axis=0)
            t = np.linspace(0, 1, right - left + 1)[:, None]
            a[r, left: right + 1] = left_color * (1 - t) + right_color * t
        image = Image.fromarray(np.rint(a).astype(np.uint8), "RGB")
        draw = ImageDraw.Draw(image)
        for baseline, text in zip(baselines, new_lines):
            draw.text((cx, baseline), text, font=target(size), fill=TEXT_COLOR, anchor="ms")
        image.save(out / path.name, optimize=True)

        if args.review:
            original = Image.open(path).convert("RGB")
            h = int(original.height * (0.2 if original.width > original.height else 0.3))
            pair = Image.new("RGB", (original.width * 2 + 20, h), (255, 0, 255))
            pair.paste(original.crop((0, 0, original.width, h)), (0, 0))
            pair.paste(image.crop((0, 0, image.width, h)), (original.width + 20, 0))
            review_tiles.append(pair.resize((1400, int(1400 * h / pair.width)), Image.LANCZOS))

if args.review and review_tiles:
    sheet = Image.new("RGB", (1400, sum(t.height + 8 for t in review_tiles)), (255, 0, 255))
    y = 0
    for tile in review_tiles:
        sheet.paste(tile, (0, y))
        y += tile.height + 8
    sheet.save(args.review)
    print(f"review sheet: {args.review}")

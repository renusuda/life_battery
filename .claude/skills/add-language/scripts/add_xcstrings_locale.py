"""Adds or replaces one locale's values in an Xcode string catalog.

Usage: python add_xcstrings_locale.py <file.xcstrings> <locale> <values.json>

values.json maps each string key to its translation. The file keeps its own
formatting: Xcode writes `" : "` in some catalogs and `": "` in others.
"""

import json
import sys
import unicodedata

path, locale, values_path = sys.argv[1:4]
text = open(path, encoding="utf-8").read()
separator = " : " if '" : ' in text else ": "
catalog = json.loads(text)
values = json.load(open(values_path, encoding="utf-8"))

unknown = set(values) - set(catalog["strings"])
if unknown:
    sys.exit(f"Keys not in {path}: {sorted(unknown)}")

for key, value in values.items():
    localizations = catalog["strings"][key].setdefault("localizations", {})
    localizations[locale] = {
        "stringUnit": {"state": "translated", "value": unicodedata.normalize("NFC", value)}
    }

output = json.dumps(catalog, indent=2, separators=(",", separator), ensure_ascii=False, sort_keys=True)
with open(path, "w", encoding="utf-8") as f:
    f.write(output + ("\n" if text.endswith("\n") else ""))
print(f"{path}: wrote {len(values)} value(s) for {locale}")

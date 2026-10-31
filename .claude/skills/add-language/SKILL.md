---
name: add-language
description: Add languages end to end (app strings, iOS strings, layout check, App Store listing, screenshots, in-app purchases, upload) without asking for approval. Accepts App Store locales such as zh-Hans or th, or "all" for every unchecked language in docs/l10n/checklist.md.
---

# Add Language

Adds languages the way Vietnamese (vi) was added. Scope is iOS only.

## How to run

- Targets: the given locales, or with `all` (or no argument) every unchecked language in `docs/l10n/checklist.md`, in its order.
- Do not ask for approval. The user authorized this skill to commit each step, create the in-app purchase localizations, and upload without confirmation. Decide open points with the defaults below and list them in the final report.
- Run it as a loop with one subagent per language, one after the other (the languages share `Info.plist`, `project.pbxproj`, the xcstrings files and the checklist, so never in parallel). Brief each subagent to follow steps 0 to 6 and 8 of this file for its locale, commit without asking, and return only a short summary: commits, layout fixes, fonts, default decisions, problems. The main agent keeps the summaries, runs step 7 once at the end, and writes the final report. This keeps the main context small.
- RTL languages (marked `(RTL)`) are added like the others. The layout is not mirrored yet (the battery, fixed left/right paddings, digits inside RTL text); the user handles that later, so only mention it in the report.
- One behavior per commit. Run `flutter analyze` and tests through a subagent, one after the other.
- Scripts live in `.claude/skills/add-language/scripts/`. Temporary files go to the scratchpad.
- Final report (in Japanese): languages done, commits, layout fixes, fonts chosen, decisions taken by default, anything skipped.

## 0. Locale codes and defaults

| Place | Code | Example (zh-Hans / es-MX) |
| --- | --- | --- |
| App Store, fastlane, checklist | App Store locale | `zh-Hans` / `es-MX` |
| ARB file | language, plus script only when needed | `app_zh_Hans.arb` / `app_es.arb` |
| iOS strings, `knownRegions`, `CFBundleLocalizations` | same as the ARB, with `-` | `zh-Hans` / `es` |
| `l10n_test` `LOCALE` | Flutter language tag | `zh-Hans` / `es` |

- A store-only variant such as `fr-CA` needs no app work when the app already has the language (`fr`). Do only steps 4 to 8.
- `localeResolutionCallback` in `lib/src/app.dart` matches the language code only. Before adding the second script of a language (`zh-Hant` after `zh-Hans`), make it prefer a match on language and script, then fall back to the language, with a unit test (`fix:` commit).
- Home screen name: keep "Life Battery" for every new language.

## 1. App strings (`feat:` commit, together with step 2)

Add `lib/src/l10n/app_<code>.arb` with every key of `app_en.arb`. Translate from both `app_en.arb` and `app_ja.arb`.

- Keep placeholders such as `{percentage}` unchanged.
- `premiumFeature*Emphasis` must be an exact substring of its `premiumFeature*Label`.
- `widgetGuideIosStep*` must use iOS's own words in that language (Edit, Add Widget).
- `dayUnit` is appended right after the number: start it with a space when the language puts spaces between words.
- Keep `fiveStarsLabel` in English, and `shareHashtag` and `shareCardAppName` as "#LifeBattery" and "Life Battery".

## 2. iOS strings

- `ios/InfoPlist.xcstrings`: `CFBundleDisplayName`.
- `ios/LifeBatteryWidget/Localizable.xcstrings`: `widget.dayUnit`, `widget.description`, `widget.displayName`, `widget.lockedDescription`, `widget.lockedTitle`, `widget.titleLabel`.

  ```bash
  python3 -I .claude/skills/add-language/scripts/add_xcstrings_locale.py <file.xcstrings> <code> <values.json>
  ```

- Add the code to `knownRegions` in `ios/Runner.xcodeproj/project.pbxproj` and to `CFBundleLocalizations` in `ios/Runner/Info.plist`.
- Run `fvm flutter gen-l10n`, then `fvm flutter analyze` and `fvm flutter test`. `test/l10n/arb_files_test.dart` catches missing keys and placeholders.

## 3. Layout check

- For a non-Latin script, make `loadIosSystemFonts` in `l10n_test/small_phone.dart` load the iOS font for that script when `targetLocale` uses it (`test:` commit). The test engine has no font fallback, so without it the text is measured with placeholder glyphs. Find the font files on this Mac (some, such as PingFang, live under `/System/Library/AssetsV2`).
- Run `fvm flutter test l10n_test/ --dart-define=LOCALE=<tag>`.
- Fix overflows and clipped text in separate `fix:` commits by shrinking or wrapping in the widget, never by shortening the translation. After a fix, run the check with `LOCALE=en` too, and keep the English and Japanese layouts unchanged when they fit.
- The SwiftUI home screen widget is not covered; its text shrinks through `minimumScaleFactor`.

## 4. App Store listing (`chore: Add the <Language> App Store listing`)

Create `fastlane/metadata/<store locale>/`:

- `name.txt` (30 characters): "Life Battery: <keywords in the language>".
- `subtitle.txt` (30 characters).
- `keywords.txt` (100 characters, comma-separated, no spaces after commas): no words already in the name or subtitle.
- `description.txt`: translation of `en-US/description.txt`.
- `promotional_text.txt`, `apple_tv_privacy_policy.txt`, `marketing_url.txt`, `privacy_url.txt`, `support_url.txt`: copy from `en-US`.

Add the language to `fastlane/default_release_notes.json` in the same commit. The text is the translation of 「より快適にお使いいただけるよう、細かな改善を行いました。」. `sync_release_notes` fails when a metadata language has no notes.

## 5. Screenshots (`chore: Add <Language> App Store screenshots`)

Only the headline of the en-US screenshots is replaced; the screen inside the device stays English.

1. Do not re-download the screenshots. A download rewrites every file with Apple's re-encoded bytes, and the next upload then re-sends them all.
2. Set up the tools in the scratchpad: `python3 -m venv <scratchpad>/venv && <scratchpad>/venv/bin/pip install Pillow numpy fonttools`. Download `ofl/poppins/Poppins-Bold.ttf` from `https://github.com/google/fonts`. Thai, Indic and other scripts that need shaping only render correctly when Pillow has Raqm (`PIL.features.check("raqm")`); the script refuses to run without it. If it is missing, install FriBiDi and libraqm with Homebrew.
3. Choose the headline font. Use Poppins Bold itself when it has every character of the captions. Otherwise pick the Google Font for the script that looks closest to Poppins Bold (Vietnamese used Be Vietnam Pro Bold). Check coverage with:

   ```bash
   <venv>/bin/python -I -c "import sys; from fontTools.ttLib import TTFont; m = TTFont(sys.argv[1]).getBestCmap(); print(sorted({c for c in sys.argv[2] if not c.isspace() and ord(c) not in m}))" <font.ttf> "<all caption text>"
   ```

4. Translate the three headlines into two lines each (`{"0": [..], "1": [..], "2": [..]}`), keeping each line about as long as the English one. The en-US headlines are in `EN` in the script.
5. Generate and review:

   ```bash
   <venv>/bin/python -I .claude/skills/add-language/scripts/replace_screenshot_headlines.py \
     --poppins <Poppins-Bold.ttf> --font <font.ttf> [--variation Bold] \
     --captions <captions.json> --src fastlane/screenshots/en-US \
     --out fastlane/screenshots/<store locale> --review <scratchpad>/review.png
   ```

   Look at the review sheet: no leftover English, no broken or cut-off glyphs, headlines centered.

## 6. In-app purchases (API, no commit)

```bash
bundle exec ruby .claude/skills/add-language/scripts/iap_localizations.rb
```

prints the current localizations. Translate the en-US and ja names and descriptions (match the app's wording, keep descriptions no longer than the English ones) into a JSON file, then create them:

```bash
bundle exec ruby .claude/skills/add-language/scripts/iap_localizations.rb <store locale> <values.json>
```

Products removed from sale are skipped. New localizations are submitted for review with the next app version.

## 7. Upload (once per run)

After all target languages are done, run `bundle exec fastlane ios upload_metadata` in the background (about two minutes) and report the result from its log. It needs an editable App Store version; if there is none, skip the upload and say so in the report.

## 8. Finish

Check each finished language in `docs/l10n/checklist.md` (`docs: Check off <Language> in the localization checklist`).

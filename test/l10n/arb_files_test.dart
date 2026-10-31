import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const _l10nDir = 'lib/src/l10n';
const _templateFileName = 'app_en.arb';

Map<String, String> _readMessages(File file) {
  final json = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
  return {
    for (final entry in json.entries)
      if (!entry.key.startsWith('@')) entry.key: entry.value as String,
  };
}

Set<String> _placeholdersOf(String message) {
  return RegExp(r'\{(\w+)\}')
      .allMatches(message)
      .map((match) => match.group(1)!)
      .toSet();
}

void main() {
  final template = _readMessages(File('$_l10nDir/$_templateFileName'));
  final translations = Directory(_l10nDir)
      .listSync()
      .whereType<File>()
      .where(
        (file) =>
            file.path.endsWith('.arb') &&
            !file.path.endsWith(_templateFileName),
      )
      .toList();

  test('Finds translation files', () {
    expect(translations, isNotEmpty);
  });

  for (final file in translations) {
    final fileName = file.uri.pathSegments.last;

    group(fileName, () {
      final messages = _readMessages(file);

      test('Has the same keys as the template', () {
        expect(messages.keys.toSet(), template.keys.toSet());
      });

      test('Keeps the placeholders of the template', () {
        for (final key in template.keys) {
          final message = messages[key];
          if (message == null) continue;

          expect(
            _placeholdersOf(message),
            _placeholdersOf(template[key]!),
            reason: key,
          );
        }
      });
    });
  }
}

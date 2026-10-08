import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/features/share/data/share_repository.dart';
import 'package:life_battery/src/features/share/domain/share_outcome.dart';

import '../../../../test_helpers/fake_share.dart';

void main() {
  test('Passes the text and image through and returns the outcome', () async {
    final fakeApi = FakeShareApiDataSource(outcome: ShareOutcome.dismissed);
    final repository = ShareRepository(apiDataSource: fakeApi);
    final bytes = Uint8List.fromList([1, 2, 3]);

    final outcome = await repository.share(text: 'hello', imageBytes: bytes);

    expect(outcome, ShareOutcome.dismissed);
    expect(fakeApi.sharedTexts, ['hello']);
    expect(fakeApi.sharedImages, [bytes]);
  });
}

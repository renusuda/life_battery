import 'package:in_app_review/in_app_review.dart';

class FakeInAppReview implements InAppReview {
  FakeInAppReview({this.available = true});

  bool available;

  int requestReviewCount = 0;

  int openStoreListingCount = 0;

  @override
  Future<bool> isAvailable() async => available;

  @override
  Future<void> requestReview() async {
    requestReviewCount++;
  }

  @override
  Future<void> openStoreListing({
    String? appStoreId,
    String? microsoftStoreId,
  }) async {
    openStoreListingCount++;
  }
}

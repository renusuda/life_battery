import 'package:in_app_review/in_app_review.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'in_app_review_provider.g.dart';

/// Exposed as a provider so tests can stand in for the store prompt.
@Riverpod(keepAlive: true)
InAppReview inAppReview(Ref ref) => InAppReview.instance;

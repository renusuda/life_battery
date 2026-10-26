/// What triggered the store review prompt, reported as the source parameter
/// of the review_request analytics event.
enum ReviewRequestSource {
  onboarding('onboarding'),
  launchCount('launch_count');

  const ReviewRequestSource(this.paramValue);

  final String paramValue;
}

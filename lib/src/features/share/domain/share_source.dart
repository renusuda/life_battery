/// Where the share card was opened from, reported as the source parameter
/// of the share analytics event.
enum ShareSource {
  onboarding('onboarding'),
  home('home');

  const ShareSource(this.paramValue);

  final String paramValue;
}

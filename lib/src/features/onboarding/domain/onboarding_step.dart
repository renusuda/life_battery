/// Reported as the step parameter of the onboarding_step analytics event.
enum OnboardingStep {
  idealAge('ideal_age'),
  birthDate('birth_date'),
  result('result'),
  label('label'),
  widget('widget'),
  paywall('paywall');

  const OnboardingStep(this.paramValue);

  final String paramValue;
}

/// Reported as the step parameter of the onboarding_step analytics event.
enum OnboardingStep {
  idealAge('ideal_age'),
  birthDate('birth_date'),
  result('result'),
  widget('widget');

  const OnboardingStep(this.paramValue);

  final String paramValue;
}

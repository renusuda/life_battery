enum ShareOutcome {
  success,
  dismissed,

  /// Android reports this for most targets, so it must not be treated as
  /// a failure.
  unavailable,
}

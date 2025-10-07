import 'package:flutter/material.dart';

/// Small shared UI state used across the app.
/// Add more app-scoped notifiers here if needed.
class AppData {
  // Controls the current index of a bottom navigation bar (default 0)
  static final ValueNotifier<int> navBarCurrentIndexNotifier = ValueNotifier(0);

  // Controls an onboarding flow current page index (default 0)
  static final ValueNotifier<int> onBoardingCurrentIndexNotifier =
      ValueNotifier(0);
}

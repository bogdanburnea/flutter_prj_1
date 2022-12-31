import 'package:flutter_prj_1/state/dark_theme_state_notifier.dart';

// logic for the page, completely decoupled from UI, link to one or more notifiers
// The job of the page’s state management class is to manage the notifiers
class SettingsStateManager {
  // state manager presents setters/logic methods for the state values
  // setters/logic methods are called from UI and perform business logic

  // which parts of the UI might change independently of the other parts.

  // state notifiers, can be more notifiers and combine different logic in setters
  // UI needs a way to listen to changes in state
  // Giving the UI layer a way to listen for state changes

  // decoupling an abstract service from its concrete implementation

  final darkThemeStateNotifier = DarkThemeStateNotifier();

  void setDarkTheme(bool darkTheme) {
    darkThemeStateNotifier.setDarkTheme(darkTheme);
  }

  bool getDarkTheme() {
    return darkThemeStateNotifier.value;
  }

// The way to make these notifiers notify any listeners is by changing their value.
// Here is the implementation of the pause method, witch use two notifiers
// so logic can be composed of more notifiers that can change more state variables
//
// class TimerPageManager {
//   final timeLeftNotifier = ...
//   final buttonNotifier = ...
//   void pause() {
//     timeLeftNotifier.pause();
//     buttonNotifier.value = ButtonState.paused;
//   }
//   ...
// }

}

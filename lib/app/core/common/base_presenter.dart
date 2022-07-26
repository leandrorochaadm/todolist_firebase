import 'package:flutter/foundation.dart';

import 'ui_state.dart';

abstract class BasePresenter {
  ValueNotifier<UIState> get state;

  void setState(UIState newState);
  void init();
  void dispose();
}

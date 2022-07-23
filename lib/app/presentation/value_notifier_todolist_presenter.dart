import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:todo_firebase/app/core/common/ui_state.dart';
import 'package:todo_firebase/app/domain/entities/todo_entity.dart';

import '../ui/pages/list/list_presenter.dart';

class ValueNotifierTodoListPresenter implements ListPresenter {
  late ValueNotifier<UIState> _state;

  @override
  late ValueNotifier<List<TodoEntity>> todoListener;

  @override
  void dispose() {
    todoListener.dispose();
    state.dispose();
  }

  @override
  void init() {
    _state = ValueNotifier(const UIInitialState());
    todoListener = ValueNotifier([]);
  }

  @override
  void loadTodoList() async {
    // TODO: implement loadTodoList
  }

  @override
  ValueNotifier<UIState> get state => _state;

  @override
  void setState(UIState newState) {
    if (_state.value is! UIInactiveState) {
      _state.value = newState;
    }
  }
}

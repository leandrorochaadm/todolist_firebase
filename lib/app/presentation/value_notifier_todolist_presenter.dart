import 'package:flutter/src/foundation/change_notifier.dart';

import '../core/common/ui_state.dart';
import '../domain/entities/todo_entity.dart';
import '../domain/usecases/get_todolist.dart';
import '../ui/pages/list/list_presenter.dart';

class ValueNotifierTodoListPresenter implements ListPresenter {
  final GetTodolist getTodolist;
  late ValueNotifier<UIState> _state;

  ValueNotifierTodoListPresenter({required this.getTodolist});

  @override
  late ValueNotifier<List<TodoEntity>> todoListener;

  @override
  void dispose() {
    todoListener.dispose();
    state.dispose();
  }

  @override
  Future<void> init() async {
    _state = ValueNotifier(const UIInitialState());
    todoListener = ValueNotifier([]);
    await loadTodoList();
  }

  @override
  Future<void> loadTodoList() async {
    try {
      setState(const UILoadingState());
      todoListener.value = await getTodolist.call();
      setState(const UISuccessState(''));
    } catch (e) {
      setState(const UIErrorState('Erro ao recuperar lista de tarefas'));
    }
  }

  @override
  ValueNotifier<UIState> get state => _state;

  @override
  void setState(UIState newState) {
    if (_state.value is! UIInactiveState && _state.value != newState) {
      _state.value = newState;
    }
  }
}

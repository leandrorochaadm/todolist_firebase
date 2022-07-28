import 'package:flutter/src/foundation/change_notifier.dart';

import '../core/common/ui_state.dart';
import '../domain/entities/todo_entity.dart';
import '../domain/usecases/get_todolist.dart';
import '../ui/pages/todolist/todolist.dart';

class ValueNotifierTodoListPresenter implements TodolistPresenter {
  final GetTodolist getTodolist;

  @override
  late ValueNotifier<UIState> state;

  ValueNotifierTodoListPresenter({required this.getTodolist});

  @override
  late ValueNotifier<List<TodoEntity>> todoListener;

  @override
  void dispose() {
    todoListener.dispose();
    state.dispose();
  }

  @override
  void init() async {
    state = ValueNotifier(const UIInitialState());
    todoListener = ValueNotifier([]);
  }

  @override
  Future<void> loadTodoList() async {
    try {
      setState(const UILoadingState());
      await Future.delayed(const Duration(seconds: 1));
      todoListener.value = await getTodolist();
      setState(const UISuccessState(''));
    } catch (e) {
      setState(const UIErrorState('Erro ao recuperar lista de tarefas'));
    }
  }

  @override
  void setState(UIState newState) {
    if (state.value is! UIInactiveState /* && state.value != newState*/) {
      state.value = newState;
    }
  }
}

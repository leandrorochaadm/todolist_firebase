import 'package:flutter/src/foundation/change_notifier.dart';

import '../../../core/common/base_presenter.dart';
import '../../../domain/entities/todo_entity.dart';

abstract class TodolistPresenter extends BasePresenter {
  late ValueNotifier<List<TodoEntity>> todoListener;
  late ValueNotifier<TodoEntity> todoSelected;

  Future<void> loadTodoList();
}

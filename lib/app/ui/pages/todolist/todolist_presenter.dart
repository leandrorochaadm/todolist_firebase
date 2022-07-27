import 'package:flutter/src/foundation/change_notifier.dart';

import '../../../core/common/base_presenter.dart';
import '../../../domain/entities/todo_entity.dart';

abstract class TodolistPresenter extends BasePresenter {
  ValueNotifier<List<TodoEntity>>? todoListener;

  Future<void> loadTodoList();
}

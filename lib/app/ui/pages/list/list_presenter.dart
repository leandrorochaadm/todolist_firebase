import 'package:flutter/src/foundation/change_notifier.dart';

import '../../../core/common/base_presenter.dart';
import '../../../domain/entities/todo_entity.dart';

abstract class ListPresenter extends BasePresenter {
  late ValueNotifier<List<TodoEntity>> todoListener;

  void loadTodoList();
}

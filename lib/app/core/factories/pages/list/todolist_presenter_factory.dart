import 'package:todo_firebase/app/presentation/value_notifier_todolist_presenter.dart';

import '../../usecases/usecases.dart';

makeTodolistPresenteFactory() =>
    ValueNotifierTodoListPresenter(getTodolist: makeGetTodolistFactory());

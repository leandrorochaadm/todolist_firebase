import 'package:flutter/material.dart';
import 'package:todo_firebase/app/ui/pages/todolist/todolist.dart';

import 'core/factories/factories.dart';
import 'routes.dart';

class AppModule {
  final TodolistPresenter todolistPresenter;
  AppModule(this.todolistPresenter);

  Map<String, WidgetBuilder> routes() => {
        Routes.Home: (BuildContext context) => makeListPage(todolistPresenter),
      };
}

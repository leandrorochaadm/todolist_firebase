import 'package:flutter/material.dart';

import 'core/factories/factories.dart';
import 'routes.dart';
import 'ui/pages/todolist/todolist.dart';

class AppModule {
  final TodolistPresenter todolistPresenter;
  AppModule(this.todolistPresenter);

  Map<String, WidgetBuilder> routes() => {
        Routes.Home: (BuildContext context) => makeListPage(todolistPresenter),
        Routes.Form: (BuildContext context) => makeFormPage(todolistPresenter),
      };
}

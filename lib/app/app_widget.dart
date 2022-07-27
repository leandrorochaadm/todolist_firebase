import 'package:flutter/material.dart';

import 'routes.dart';

class AppWidget extends StatelessWidget {
  final Map<String, WidgetBuilder> routes;
  const AppWidget({Key? key, required this.routes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoList',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: routes,
      initialRoute: Routes.Home,
    );
  }
}

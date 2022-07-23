import 'package:flutter/material.dart';
import 'package:todo_firebase/app/app_module.dart';
import 'package:todo_firebase/app/routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoList',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: AppModule().routes(),
      initialRoute: Routes.Home,
    );
  }
}

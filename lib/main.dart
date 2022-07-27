import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_firebase/app/core/factories/pages/todolist/todolist_presenter_factory.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final module = AppModule(makeTodolistPresenteFactory());
  runApp(AppWidget(routes: module.routes()));
}

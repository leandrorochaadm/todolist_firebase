import 'package:flutter/material.dart';
import 'package:todo_firebase/app/ui/pages/todolist/todolist.dart';

class TodolistPage extends StatefulWidget {
  final TodolistPresenter presenter;

  const TodolistPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<TodolistPage> createState() => _TodolistPageState();
}

class _TodolistPageState extends State<TodolistPage> {
  @override
  void initState() {
    widget.presenter.init();
    super.initState();
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tarefas'),
        centerTitle: true,
      ),
      body: Text(widget.presenter.state.toString()),
    );
  }
}

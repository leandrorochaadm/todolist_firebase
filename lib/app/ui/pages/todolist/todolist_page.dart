import 'package:flutter/material.dart';
import 'package:todo_firebase/app/core/common/base_page_widget.dart';
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
    widget.presenter.loadTodoList();
    widget.presenter.state.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('todo ${widget.presenter.state.value}');
    return BasePageWidget(
      state: widget.presenter.state,
      title: 'Lista de tarefas',
      child: widget.presenter.todoListener.value.isNotEmpty
          ? Text(widget.presenter.todoListener.value.toString())
          : const SizedBox.shrink(),
    );
  }
}

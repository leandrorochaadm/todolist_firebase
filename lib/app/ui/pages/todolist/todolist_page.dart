import 'package:flutter/material.dart';
import 'package:todo_firebase/app/core/common/base_page_widget.dart';
import 'package:todo_firebase/app/domain/entities/entities.dart';
import 'package:todo_firebase/app/ui/pages/todolist/todolist.dart';

import '../../../routes.dart';

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
    // print('todo ${widget.presenter.state.value}');
    // return        const Text('Todolist');
    return BasePageWidget(
      state: widget.presenter.state,
      title: 'Lista de tarefas',
      child: Column(
        children: [
          const Text('Todolist'),
          /*       widget.presenter.todoListener.value.isNotEmpty
              ? Container(
                  color: Colors.lightGreenAccent,
                  child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, Routes.Form),
                      child:
                          Text(widget.presenter.todoListener.value.toString())),
                )
              : const SizedBox.shrink(),*/
          ValueListenableBuilder<List<TodoEntity>>(
            valueListenable: widget.presenter.todoListener,
            builder: (context, list, _) {
              if (list.isEmpty) {
                return const Text('Lista está fazia');
              }
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final item = list[index];
                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.category),
                    onTap: () {
                      widget.presenter.todoSelected.value = item;
                      Navigator.pushNamed(context, Routes.Form);
                    },
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}

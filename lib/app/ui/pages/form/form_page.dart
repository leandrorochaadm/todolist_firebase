import 'package:flutter/material.dart';
import 'package:todo_firebase/app/domain/entities/todo_entity.dart';
import 'package:todo_firebase/app/ui/pages/todolist/todolist_presenter.dart';

class FormPage extends StatefulWidget {
  final TodolistPresenter presenter;
  const FormPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final categoryController = TextEditingController();
  final statusController = TextEditingController();

  @override
  void initState() {
    titleController.addListener(() {
      print(titleController.text);
    });
    titleController.text = widget.presenter.todoSelected.value.title;
    categoryController.text = widget.presenter.todoSelected.value.category;
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    categoryController.dispose();
    statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarefas')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(height: 8),
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Titulo',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (value.length <= 3) {
                    return 'Titulo precisa se maior';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: categoryController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (value.length <= 3) {
                    return 'Categoria precisa se maior';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Categoria',
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final todo = TodoEntity(
                      title: titleController.text,
                      status: false,
                      category: categoryController.text,
                    );
                    print(todo);

                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Gravando...')));
                  }
                },
                child: const Text('Gravar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

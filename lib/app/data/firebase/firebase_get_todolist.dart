import '../../core/firebase/firebase.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/get_todolist.dart';
import '../models/models.dart';

class FirebaseGetTodolist implements GetTodolist {
  final FirebaseClient firebaseClient;

  FirebaseGetTodolist({required this.firebaseClient});

  @override
  Future<List<TodoEntity>> call() async {
    try {
      final res = await firebaseClient.get(path: 'todolist') as List;
      return res
          .map((todo) => FirebaseTodolistModel.fromJson(todo).toEntity())
          .toList();
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}

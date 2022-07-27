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
      final res = await firebaseClient.get(path: 'todolist/todolist');
      final resList = (res['1'] as List<dynamic>);

      final jsonList =
          resList.map((todo) => FirebaseTodolistModel.fromJson(todo)).toList();
      final entityList = jsonList.map((json) => json.toEntity()).toList();
      return entityList;
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}

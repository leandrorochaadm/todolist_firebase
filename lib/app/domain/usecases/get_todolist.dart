import '../entities/entities.dart';

abstract class GetTodolist {
  Future<List<TodoEntity>> call();
}

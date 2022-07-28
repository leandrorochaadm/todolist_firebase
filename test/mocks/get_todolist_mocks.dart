import 'package:mocktail/mocktail.dart';
import 'package:todo_firebase/app/domain/entities/entities.dart';
import 'package:todo_firebase/app/domain/helpers/helpers.dart';
import 'package:todo_firebase/app/domain/usecases/get_todolist.dart';

class GetTodolistSpy extends Mock implements GetTodolist {
  When mockCall() => when(() => call());
  void mock(List<TodoEntity> response) => mockCall().thenAnswer(
        (_) => Future.value(response),
      );
  void mockError() => mockCall().thenThrow((_) => DomainError.unexpected);
}

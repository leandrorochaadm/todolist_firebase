import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_firebase/app/core/common/ui_state.dart';
import 'package:todo_firebase/app/domain/entities/entities.dart';
import 'package:todo_firebase/app/presentation/value_notifier_todolist_presenter.dart';

import '../mocks/get_todolist_mocks.dart';

void main() {
  late ValueNotifierTodoListPresenter sut;
  late GetTodolistSpy getTodolistSpy;
  List<UIState> states = [];
  setUp(() => {
        getTodolistSpy = GetTodolistSpy(),
        sut = ValueNotifierTodoListPresenter(getTodolist: getTodolistSpy),
        sut.state = ValueNotifier(const UIInactiveState()),
        sut.todoListener = ValueNotifier([]),
        sut.state.addListener(() {
          states.add(sut.state.value);
        })
      });

  void cleanState() {
    states = [];
  }

  test('Should set notifiers on init method', () {
    sut.init();

    expect(sut.state.value, const UIInitialState());
    expect(sut.todoListener.value, []);
  });

  test('Should call getTodolist use case on loadTodolist method', () async {
    await sut.loadTodoList();
    verify(() => GetTodolistSpy());
  });

/*
 test('Should emit error state when loadTodolist method failed to getTodolist',
      () async {
    cleanState();
    getTodolistSpy.mockError();
    await sut.loadTodoList();

    expect(
      states.first,
      const UIErrorState('Erro ao recuperar lista de tarefas'),
    );
  });
  */

  test(
      'Should call use case with correct values and set a value for todolistener on loadTodolist method',
      () async {
    final fakeTodolistInfo = [
      TodoEntity(
        title: faker.lorem.sentence(),
        status: random.boolean(),
        category: faker.lorem.word(),
      )
    ];
    getTodolistSpy.mock(fakeTodolistInfo);
    await sut.loadTodoList();
    expect(sut.todoListener.value, fakeTodolistInfo);
  });
}

import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/globals/states/onze_state.dart';
import 'package:todo/modules/todos/domain/entities/todo_entity.dart';
import 'package:todo/modules/todos/domain/usecases/stream_todos_usecase.dart';

class MyTodosController {
  final StreamTodosUsecase _streamTodos;

  MyTodosController({
    required StreamTodosUsecase streamTodos,
  }) : _streamTodos = streamTodos {
    initialize();
  }

  late final StreamSubscription<Either<Failure, List<TodoEntity>>>
      _subscription;

  final _todos = RxNotifier<OnzeState<List<TodoEntity>>>(Initial());
  OnzeState<List<TodoEntity>> get todos => _todos.value;

  initialize() {
    log('Initialized');
    _subscription = _streamTodos.call().listen(
          (value) => _setTodos(value),
        );
  }

  _setTodos(Either<Failure, List<TodoEntity>> values) {
    try {
      _todos.value = Loading();

      values.fold(
        (failure) {
          _todos.value = Error(failure);
        },
        (todos) {
          if (todos.isEmpty) {
            _todos.value = Empty();
            return;
          }

          _todos.value = Loaded(todos);
        },
      );
    } catch (e, s) {
      _todos.value = Error(Failure(error: e, stackTrace: s));
    }
  }

  dispose() {
    _subscription.cancel();
    _todos.dispose();
  }
}

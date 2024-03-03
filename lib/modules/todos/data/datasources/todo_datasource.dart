import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/modules/todos/data/models/create_todo_model.dart';
import 'package:todo/modules/todos/data/models/todo_model.dart';
import 'package:todo/modules/todos/domain/enums/todo_status.dart';

abstract class TodoDatasource {
  Future<Either<Failure, void>> createTodo(CreateTodoModel value);

  Stream<Either<Failure, List<TodoModel>>> streamTodos(String deviceId);

  Future<Either<Failure, void>> updateStatus({
    required String id,
    required TodoStatus status,
  });
}
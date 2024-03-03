import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/modules/todos/domain/entities/create_todo_entity.dart';
import 'package:todo/modules/todos/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<Either<Failure, void>> createTodo(CreateTodoEntity value);

  Stream<Either<Failure, List<TodoEntity>>> streamTodos(String deviceId);
}

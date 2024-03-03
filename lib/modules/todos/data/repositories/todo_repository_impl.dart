import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/modules/todos/data/datasources/todo_datasource.dart';
import 'package:todo/modules/todos/data/mappers/create_todo_mapper.dart';
import 'package:todo/modules/todos/data/mappers/todo_mapper.dart';
import 'package:todo/modules/todos/domain/entities/create_todo_entity.dart';
import 'package:todo/modules/todos/domain/entities/todo_entity.dart';
import 'package:todo/modules/todos/domain/enums/todo_status.dart';
import 'package:todo/modules/todos/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDatasource _todoDataSource;

  TodoRepositoryImpl({
    required TodoDatasource todoDataSource,
  }) : _todoDataSource = todoDataSource;

  @override
  Future<Either<Failure, void>> createTodo(CreateTodoEntity value) async {
    try {
      final model = CreateTodoMapper.toModel(value);

      return await _todoDataSource.createTodo(model);
    } catch (e, s) {
      return Left(Failure(error: e, stackTrace: s));
    }
  }

  @override
  Stream<Either<Failure, List<TodoEntity>>> streamTodos(
    String deviceId,
  ) async* {
    try {
      yield* _todoDataSource.streamTodos(deviceId).map(
        (event) {
          return event.fold(
            (failure) => Left(failure),
            (models) {
              final entities = models.map(TodoMapper.toEntity).toList();

              return Right(entities);
            },
          );
        },
      );
    } catch (e, s) {
      yield Left(Failure(error: e, stackTrace: s));
    }
  }

  @override
  Future<Either<Failure, void>> updateStatus({
    required String id,
    required TodoStatus status,
  }) async {
    try {
      return await _todoDataSource.updateStatus(
        id: id,
        status: status,
      );
    } catch (e, s) {
      return Left(Failure(error: e, stackTrace: s));
    }
  }

  @override
  Future<Either<Failure, void>> delete(String todoId) async {
    try {
      return await _todoDataSource.delete(todoId);
    } catch (e, s) {
      return Left(Failure(error: e, stackTrace: s));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/modules/todos/data/datasources/todo_datasource.dart';
import 'package:todo/modules/todos/data/mappers/create_todo_mapper.dart';
import 'package:todo/modules/todos/domain/entities/create_todo_entity.dart';
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
}

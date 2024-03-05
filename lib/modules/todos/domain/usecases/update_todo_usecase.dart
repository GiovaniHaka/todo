import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/modules/todos/domain/enums/todo_status.dart';
import 'package:todo/modules/todos/domain/repositories/todo_repository.dart';

abstract class UpdateTodoUsecase {
  Future<Either<Failure, void>> call({
    required String id,
    required TodoStatus status,
  });
}

/// Classe que implementa o caso de uso de atualização de um todo.
class UpdateTodoUsecaseImpl implements UpdateTodoUsecase {
  final TodoRepository _repository;

  UpdateTodoUsecaseImpl({
    required TodoRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, void>> call({
    required String id,
    required TodoStatus status,
  }) async {
    try {
      return await _repository.updateStatus(
        id: id,
        status: status,
      );
    } catch (e, s) {
      return Left(Failure(error: e, stackTrace: s));
    }
  }
}

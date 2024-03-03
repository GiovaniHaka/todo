import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/modules/todos/domain/repositories/todo_repository.dart';

abstract class DeleteTodoUsecase {
  Future<Either<Failure, void>> call({
    required String id,
  });
}

class DeleteTodoUsecaseImpl implements DeleteTodoUsecase {
  final TodoRepository _repository;

  DeleteTodoUsecaseImpl({
    required TodoRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, void>> call({
    required String id,
  }) async {
    try {
      return await _repository.delete(id);
    } catch (e, s) {
      return Left(Failure(error: e, stackTrace: s));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/modules/todos/domain/enums/todo_status.dart';
import 'package:todo/modules/todos/domain/usecases/update_todo_usecase.dart';

class UpdateTodoStatusController {
  final UpdateTodoUsecase _updateTodoUseCase;

  UpdateTodoStatusController({
    required UpdateTodoUsecase updateTodoUseCase,
  }) : _updateTodoUseCase = updateTodoUseCase;

  Future<Either<Failure, void>> updateTodoStatus({
    required String id,
    required TodoStatus status,
  }) async {
    try {
      return await _updateTodoUseCase.call(
        id: id,
        status: status,
      );
    } catch (e, s) {
      return Left(Failure(error: e, stackTrace: s));
    }
  }
}

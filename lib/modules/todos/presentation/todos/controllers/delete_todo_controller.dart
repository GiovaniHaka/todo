import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/modules/todos/domain/usecases/delete_todo_usecase.dart';

/// Classe que representa o controlador de deleção de um todo.
class DeleteTodoController {
  final DeleteTodoUsecase _deleteTodoUseCase;

  DeleteTodoController({
    required DeleteTodoUsecase deleteTodoUseCase,
  }) : _deleteTodoUseCase = deleteTodoUseCase;

  Future<Either<Failure, void>> deleteById({
    required String id,
  }) async {
    try {
      return await _deleteTodoUseCase.call(id: id);
    } catch (e, s) {
      return Left(Failure(error: e, stackTrace: s));
    }
  }
}

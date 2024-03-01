import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/globals/states/onze_state.dart';
import 'package:todo/modules/todos/domain/usecases/create_todo_usecase.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CreateTodoController {
  final CreateTodoUsecase _createTodoUsecase;

  CreateTodoController({
    required CreateTodoUsecase createTodoUsecase,
  }) : _createTodoUsecase = createTodoUsecase;

  final _state = RxNotifier<OnzeState>(Initial());
  OnzeState get state => _state.value;

  Future<Either<Failure, void>> createTodo({
    required String title,
    required DateTime date,
  }) async {
    try {
      _state.value = Loading();

      final result = await _createTodoUsecase(
        date: date,
        title: title,
      );

      return result.fold(
        (failure) {
          _state.value = Initial();
          return Left(failure);
        },
        (success) => const Right(null),
      );
    } catch (e, s) {
      _state.value = Initial();
      return Left(Failure(error: e, stackTrace: s));
    }
  }
}

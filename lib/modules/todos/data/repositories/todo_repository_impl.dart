import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/modules/todos/data/datasources/todo_datasource.dart';
import 'package:todo/modules/todos/data/mappers/create_todo_mapper.dart';
import 'package:todo/modules/todos/data/mappers/todo_mapper.dart';
import 'package:todo/modules/todos/domain/entities/create_todo_entity.dart';
import 'package:todo/modules/todos/domain/entities/todo_entity.dart';
import 'package:todo/modules/todos/domain/enums/todo_status.dart';
import 'package:todo/modules/todos/domain/repositories/todo_repository.dart';

/// Classe que representa a implementação do repositório de todos.
class TodoRepositoryImpl implements TodoRepository {
  final TodoDatasource _todoDataSource;

  TodoRepositoryImpl({
    required TodoDatasource todoDataSource,
  }) : _todoDataSource = todoDataSource;

  /// Cria uma nova tarefa no repositório de tarefas.
  ///
  /// Retorna um [Future] que pode conter um [Failure] ou [void].
  /// 
  /// O parâmetro [value] é uma instância de [CreateTodoEntity] que representa a tarefa a ser criada.
  /// 
  /// Lança uma exceção [Failure] caso ocorra algum erro durante a criação da tarefa.
  @override
  Future<Either<Failure, void>> createTodo(CreateTodoEntity value) async {
    try {
      final model = CreateTodoMapper.toModel(value);

      return await _todoDataSource.createTodo(model);
    } catch (e, s) {
      return Left(Failure(error: e, stackTrace: s));
    }
  }
  /// Retorna um [Stream] que emite uma lista de [TodoEntity] ou um [Failure].
  ///
  /// O método [streamTodos] recebe um [deviceId] como parâmetro e retorna um [Stream]
  /// que emite uma lista de [TodoEntity] ou um [Failure]. O [Stream] é obtido a partir
  /// do [_todoDataSource] que é responsável por fornecer os dados dos todos.
  ///
  /// Caso ocorra algum erro durante a execução do método, uma [Failure] é emitida
  /// através do [Stream].
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
  /// Atualiza o status de uma tarefa com o ID fornecido.
  ///
  /// Retorna um [Future] que pode ser resolvido com um [Either] contendo um [Failure] caso ocorra algum erro,
  /// ou [void] caso a atualização seja bem-sucedida.
  ///
  /// Parâmetros:
  /// - [id]: O ID da tarefa a ser atualizada.
  /// - [status]: O novo status da tarefa.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// final result = await todoRepository.updateStatus(id: '123', status: TodoStatus.completed);
  /// result.fold(
  ///   (failure) => print('Erro ao atualizar o status da tarefa: ${failure.error}'),
  ///   (_) => print('Status da tarefa atualizado com sucesso.'),
  /// );
  /// ```
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
  /// Deletes a todo item with the given [todoId].
  ///
  /// Returns a [Future] that completes with an [Either] containing a [Failure] or `void`.
  /// If the deletion is successful, the [Either] will contain `void`.
  /// If an error occurs during the deletion, the [Either] will contain a [Failure] object
  /// with the [error] and [stackTrace] information.
  ///
  /// Example usage:
  /// ```dart
  /// final result = await delete('todoId');
  /// result.fold(
  ///   (failure) => print('Error: ${failure.error}'),
  ///   (_) => print('Deletion successful'),
  /// );
  /// ```
  Future<Either<Failure, void>> delete(String todoId) async {
    try {
      return await _todoDataSource.delete(todoId);
    } catch (e, s) {
      return Left(Failure(error: e, stackTrace: s));
    }
  }
}

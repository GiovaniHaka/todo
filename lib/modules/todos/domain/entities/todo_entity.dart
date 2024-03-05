import 'package:todo/modules/todos/domain/enums/todo_status.dart';
/// Classe que representa uma entidade de tarefa (todo).
class TodoEntity {
  final String id;
  final String title;
  final DateTime date;
  final TodoStatus status;
  final String? imageUrl;

  /// Construtor da classe TodoEntity.
  ///
  /// Recebe os parâmetros obrigatórios [id], [title], [date], [status] e [imageUrl].
  TodoEntity({
    required this.id,
    required this.title,
    required this.date,
    required this.status,
    required this.imageUrl,
  });

  /// Verifica se a tarefa está concluída.
  bool get isCompleted => status == TodoStatus.completed;

  /// Verifica se a tarefa está pendente.
  bool get isPending => status == TodoStatus.pending;
}
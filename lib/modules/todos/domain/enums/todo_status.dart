const _pending = 'pending';
const _completed = 'completed';

/// Enum que representa o status de uma tarefa.
enum TodoStatus {
  pending(_pending),
  completed(_completed),
  ;

  const TodoStatus(this.status);

  final String status;

  static TodoStatus fromString(String status) {
    switch (status) {
      case _pending:
        return TodoStatus.pending;
      case _completed:
        return TodoStatus.completed;
      default:
        throw Exception('Invalid TodoStatus: $status');
    }
  }
}

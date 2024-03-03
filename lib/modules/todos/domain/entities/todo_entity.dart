import 'package:todo/modules/todos/domain/enums/todo_status.dart';

class TodoEntity {
  final String id;
  final String title;
  final DateTime date;
  final TodoStatus status;
  final String? imageUrl;

  TodoEntity({
    required this.id,
    required this.title,
    required this.date,
    required this.status,
    required this.imageUrl,
  });

  bool get isCompleted => status == TodoStatus.completed;

  bool get isPending => status == TodoStatus.pending;
}
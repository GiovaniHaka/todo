import 'package:todo/modules/todos/domain/enums/todo_status.dart';

class TodoEntity {
  final String id;
  final String title;
  final DateTime date;
  final TodoStatus status;

  TodoEntity({
    required this.id,
    required this.title,
    required this.date,
    required this.status,
  });
}
import 'package:todo/globals/helpers/timestamp_converter.dart';
import 'package:todo/modules/todos/domain/enums/todo_status.dart';

class TodoModel {
  final String id;
  final String title;
  final DateTime date;
  final TodoStatus status;

  TodoModel({
    required this.id,
    required this.title,
    required this.date,
    required this.status,
  });

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      date: TimestampConverter.fromJson(map['date']),
      status: TodoStatus.fromString(map['status']),
    );
  }
}
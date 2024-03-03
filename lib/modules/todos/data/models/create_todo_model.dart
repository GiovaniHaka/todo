import 'package:todo/globals/helpers/timestamp_converter.dart';
import 'package:todo/modules/todos/domain/enums/todo_status.dart';

class CreateTodoModel {
  final String deviceId;
  final String title;
  final DateTime date;

  CreateTodoModel({
    required this.deviceId,
    required this.title,
    required this.date,
  });

  toMap() {
    final timestamp = TimestampConverter.toJson(date);

    return {
      'deviceId': deviceId,
      'title': title,
      'date': timestamp,
      'status': TodoStatus.pending.status,
    };
  }
}

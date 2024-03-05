import 'package:todo/globals/helpers/timestamp_converter.dart';
import 'package:todo/modules/todos/domain/enums/todo_status.dart';

/// Classe que representa o modelo de criação de um todo.
class CreateTodoModel {
  final String deviceId;
  final String title;
  final DateTime date;
  final String? imageUrl;

  CreateTodoModel({
    required this.deviceId,
    required this.title,
    required this.date,
    this.imageUrl,
  });

  toMap() {
    final timestamp = TimestampConverter.toJson(date);

    return {
      'deviceId': deviceId,
      'title': title,
      'date': timestamp,
      'status': TodoStatus.pending.status,
      'imageUrl': imageUrl,
    };
  }
}

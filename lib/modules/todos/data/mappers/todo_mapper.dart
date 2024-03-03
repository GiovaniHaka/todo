import 'package:todo/modules/todos/data/models/todo_model.dart';
import 'package:todo/modules/todos/domain/entities/todo_entity.dart';

class TodoMapper {
  static TodoEntity toEntity(TodoModel entity) {
    return TodoEntity(
      id: entity.id,
      title: entity.title,
      date: entity.date,
      status: entity.status,
      imageUrl: entity.imageUrl,
    );
  }
}

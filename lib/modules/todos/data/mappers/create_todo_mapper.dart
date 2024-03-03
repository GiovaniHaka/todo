import 'package:todo/modules/todos/data/models/create_todo_model.dart';
import 'package:todo/modules/todos/domain/entities/create_todo_entity.dart';

class CreateTodoMapper {
  static CreateTodoModel toModel(CreateTodoEntity entity) {
    return CreateTodoModel(
      deviceId: entity.deviceId,
      title: entity.title,
      date: entity.date,
      imageUrl: entity.imageUrl,
    );
  }
}

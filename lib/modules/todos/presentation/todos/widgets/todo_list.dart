import 'package:flutter/material.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';

import 'package:todo/modules/todos/domain/entities/todo_entity.dart';
import 'package:todo/modules/todos/presentation/todos/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  final List<TodoEntity> todos;
  final ValueChanged<TodoEntity> onTodoTap;

  const TodoList({
    Key? key,
    required this.todos,
    required this.onTodoTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];

        return TodoItem(
          todo: todo,
        );
      },
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: OnzeColors.greyLight,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';

import 'package:todo/modules/todos/domain/entities/todo_entity.dart';
import 'package:todo/modules/todos/presentation/todos/widgets/todo_item.dart';

/// Classe que representa uma lista de todos.
class TodoList extends StatelessWidget {
  final List<TodoEntity> todos;
  final ValueChanged<TodoEntity> onTapTodo;
  final ValueChanged<TodoEntity> onTapDeleteTodo;

  const TodoList({
    Key? key,
    required this.todos,
    required this.onTapTodo,
    required this.onTapDeleteTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];

        return TodoItem(
          todo: todo,
          onTapDelete: onTapDeleteTodo,
          onTapTodo: onTapTodo,
        );
      },
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: OnzeColors.greyLight,
      ),
    );
  }
}

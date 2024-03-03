import 'package:flutter/material.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/modules/todos/domain/entities/todo_entity.dart';
import 'package:todo/modules/todos/presentation/todo_carousel/todo_carousel_item.dart';

class TodoCarousel extends StatelessWidget {
  final List<TodoEntity> todos;
  final EdgeInsets? itemPadding;
  final double height;
  final ValueChanged<TodoEntity> onTapCompleteTodo;

  const TodoCarousel({
    Key? key,
    required this.todos,
    required this.onTapCompleteTodo,
    this.itemPadding,
    this.height = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = todos
        .map(
          (todo) => Padding(
            padding: itemPadding ?? const EdgeInsets.all(viewPadding),
            child: TodoCarouselItem(
              key: Key(todo.id),
              todo: todo,
              onTapCompleteTodo: onTapCompleteTodo,
            ),
          ),
        )
        .toList();

    return SizedBox(
      height: height,
      child: PageView(
        children: items,
      ),
    );
  }
}

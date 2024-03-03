import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/extensions/string_extensions.dart';
import 'package:todo/globals/ui/buttons/onze_icon_button.dart';
import 'package:todo/globals/ui/separators/separators.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';
import 'package:todo/globals/ui/switchs/todo_check_switch.dart';

import 'package:todo/modules/todos/domain/entities/todo_entity.dart';

class TodoItem extends StatelessWidget {
  final ValueChanged<TodoEntity>? onTapTodo;
  final ValueChanged<TodoEntity>? onTapDelete;
  final TodoEntity todo;

  const TodoItem({
    Key? key,
    required this.todo,
    this.onTapTodo,
    this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCompleted = todo.isCompleted;

    handleUpdateStatus() {
      onTapTodo?.call(todo);
    }

    handleDelete() {
      onTapDelete?.call(todo);
    }

    return InkWell(
      onTap: handleUpdateStatus,
      child: Padding(
        padding: const EdgeInsets.all(regularPadding),
        child: Row(
          children: [
            TodoCheckSwitch(
              value: isCompleted,
              onChanged: (val) {
                handleUpdateStatus();
              },
            ),
            const HorizontalSeparator.small(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    todo.title,
                    style: OnzeTextStyle.titleMedium().copyWith(
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  if (!isCompleted) ...[
                    const VerticalSeparator.text(),
                    Text(
                      DateFormat.MMMEd().format(todo.date).capitalize(),
                      style: OnzeTextStyle.labelMedium().copyWith(
                        color: OnzeColors.greyDark,
                      ),
                    ),
                  ]
                ],
              ),
            ),
            const HorizontalSeparator.small(),
            OnzeIconButton(
              icon: Icons.delete,
              foregroundColor: OnzeColors.greyLight,
              onTap: handleDelete,
            ),
          ],
        ),
      ),
    );
  }
}

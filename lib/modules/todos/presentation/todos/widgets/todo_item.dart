import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/ui/separators/separators.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';
import 'package:todo/globals/ui/switchs/todo_check_switch.dart';

import 'package:todo/modules/todos/domain/entities/todo_entity.dart';
import 'package:todo/modules/todos/domain/enums/todo_status.dart';

class TodoItem extends StatelessWidget {
  final VoidCallback? onTap;
  final TodoEntity todo;

  const TodoItem({
    Key? key,
    required this.todo,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCompleted = todo.status == TodoStatus.completed;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(regularPadding),
        child: Row(
          children: [
            TodoCheckSwitch(
              value: isCompleted,
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
                      DateFormat.MMMEd().format(todo.date),
                      style: OnzeTextStyle.labelMedium().copyWith(
                        color: OnzeColors.greyDark,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

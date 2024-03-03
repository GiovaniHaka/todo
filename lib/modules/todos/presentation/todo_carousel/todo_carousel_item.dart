import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/binders/binder.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/constants/radius_constants.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';
import 'package:todo/globals/ui/switchs/todo_check_switch.dart';

import 'package:todo/modules/todos/domain/entities/todo_entity.dart';
import 'package:todo/modules/todos/domain/enums/todo_status.dart';
import 'package:todo/modules/todos/presentation/todos/controllers/update_todo_status_controller.dart';

class TodoCarouselItem extends StatelessWidget {
  final TodoEntity todo;

  const TodoCarouselItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final updateStatusController = getIt<UpdateTodoStatusController>();

    handleUpdateStatus() {
      updateStatusController.updateTodoStatus(
        id: todo.id,
        status: TodoStatus.completed,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(regularRadius),
      child: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(viewPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      todo.title,
                      style: OnzeTextStyle.titleLarge(),
                    ),
                    Text(
                      DateFormat.MMMEd().format(todo.date),
                      style: OnzeTextStyle.bodyMedium(),
                    ),
                  ],
                ),
              ),
              TodoCheckSwitch(
                value: todo.isCompleted,
                onChanged: (value) {
                  handleUpdateStatus();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

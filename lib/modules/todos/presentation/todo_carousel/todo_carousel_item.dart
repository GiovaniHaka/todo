import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/globals/constants/image_constants.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/constants/radius_constants.dart';
import 'package:todo/globals/extensions/string_extensions.dart';
import 'package:todo/globals/ui/cards/onze_glassmorpism_container.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';
import 'package:todo/globals/ui/switchs/todo_check_switch.dart';

import 'package:todo/modules/todos/domain/entities/todo_entity.dart';

/// Classe que representa um item do carrossel de todos.
class TodoCarouselItem extends StatelessWidget {
  final TodoEntity todo;
  final ValueChanged<TodoEntity> onTapCompleteTodo;

  const TodoCarouselItem({
    Key? key,
    required this.todo,
    required this.onTapCompleteTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleUpdateStatus() {
      onTapCompleteTodo.call(todo);
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(regularRadius),
        border: Border.all(
          color: OnzeColors.greyLight,
          width: 2,
        ),
        image: todo.imageUrl == null
            ? const DecorationImage(
                image: AssetImage(ImageConstants.imagePlaceholder),
                fit: BoxFit.cover,
              )
            : DecorationImage(
                image: NetworkImage(todo.imageUrl!),
                fit: BoxFit.cover,
              ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(smallPadding),
        child: Column(
          children: [
            const Spacer(),
            OnzeGlassMorphismContainer(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          todo.title,
                          style: OnzeTextStyle.titleMedium(),
                        ),
                        Text(
                          DateFormat.MMMEd().format(todo.date).capitalize(),
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
          ],
        ),
      ),
    );
  }
}

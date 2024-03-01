import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/keys/snackbar_key.dart';
import 'package:todo/globals/messages/messages.dart';
import 'package:todo/globals/states/onze_state.dart';
import 'package:todo/globals/ui/app_bars/onze_app_bar.dart';
import 'package:todo/globals/ui/app_bars/onze_bottom_app_bar.dart';
import 'package:todo/globals/ui/buttons/onze_filled_button.dart';
import 'package:todo/globals/ui/form_fields/onze_text_form_field.dart';
import 'package:todo/globals/ui/form_fields/onze_unfocuser.dart';
import 'package:todo/globals/ui/separators/separators.dart';
import 'package:todo/globals/ui/snackbars/onze_snackbars.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';
import 'package:todo/globals/ui/views/loading_view.dart';
import 'package:todo/globals/validators/onze_validator.dart';
import 'package:todo/modules/todos/presentation/create_todo/controllers/create_todo_controller.dart';

class CreateTodoScreen extends StatelessWidget {
  final CreateTodoController createTodoController;

  const CreateTodoScreen({
    Key? key,
    required this.createTodoController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    DateTime date = DateTime.now();

    onChangeDate(DateTime val) {
      date = val;
    }

    handleCreate() async {
      final isValid = formKey.currentState?.validate() ?? false;

      if (!isValid) {
        return;
      }

      createTodoController
          .createTodo(title: titleController.text, date: date)
          .then(
        (value) {
          value.fold(
            (l) => OnzeErrorSnackBar(message: l.message).show(snackbarKey),
            (r) => Navigator.of(context).pop(),
          );
        },
      );
    }

    return OnzeUnfocuser(
      child: Scaffold(
        appBar: OnzeAppBar(
          titleText: Messages.instance.lang.createTodo,
        ),
        body: RxBuilder(builder: (context) {
          final state = createTodoController.state;

          if (state is Loading) {
            return const LoadingView();
          }

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(viewPadding),
                sliver: Form(
                  key: formKey,
                  child: SliverList.list(
                    children: [
                      Text(
                        Messages.instance.lang.details,
                        style: OnzeTextStyle.headlineMedium(),
                      ),
                      const VerticalSeparator.medium(),
                      OnzeTextFormField(
                        labelText: Messages.instance.lang.title,
                        hintText: Messages.instance.lang.hintTodoTitle,
                        controller: titleController,
                        validator: OnzeValidator.emptyOrNull,
                      ),
                      const VerticalSeparator.medium(),
                      CalendarDatePicker(
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                        onDateChanged: onChangeDate,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
        bottomNavigationBar: RxBuilder(builder: (context) {
          final isLoading = createTodoController.state is Loading;
          return OnzeBottomAppBar(
            child: OnzeFilledButton.primary(
              text: Messages.instance.lang.buttonCreateTodo,
              onTap: handleCreate,
              isLoading: isLoading,
            ),
          );
        }),
      ),
    );
  }
}

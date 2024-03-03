import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/extensions/string_extensions.dart';
import 'package:todo/globals/keys/snackbar_key.dart';
import 'package:todo/globals/messages/messages.dart';
import 'package:todo/globals/states/onze_state.dart';
import 'package:todo/globals/ui/app_bars/onze_app_bar.dart';
import 'package:todo/globals/ui/app_bars/onze_bottom_app_bar.dart';
import 'package:todo/globals/ui/buttons/onze_filled_button.dart';
import 'package:todo/globals/ui/buttons/onze_picker_button.dart';
import 'package:todo/globals/ui/form_fields/onze_text_form_field.dart';
import 'package:todo/globals/ui/form_fields/onze_unfocuser.dart';
import 'package:todo/globals/ui/separators/separators.dart';
import 'package:todo/globals/ui/snackbars/onze_snackbars.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';
import 'package:todo/globals/ui/views/loading_view.dart';
import 'package:todo/globals/validators/onze_validator.dart';
import 'package:todo/modules/todos/presentation/create_todo/controllers/create_todo_controller.dart';
import 'package:todo/services/file_picker/domain/models/picked_file_entity.dart';
import 'package:todo/services/file_picker/presentation/select_file_form_field.dart';

class CreateTodoScreen extends StatefulWidget {
  final CreateTodoController createTodoController;

  const CreateTodoScreen({
    Key? key,
    required this.createTodoController,
  }) : super(key: key);

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  PickedFile? pickedFile;
  DateTime date = DateTime.now();

  onChangeDate(DateTime val) {
    setState(() {
      date = val;
    });
  }

  onChooseFile(PickedFile? val) {
    pickedFile = val;
  }

  handleChooseDate() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      builder: (_) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(viewPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      Messages.instance.lang.whatIsTodoDate,
                      style: OnzeTextStyle.headlineSmall(),
                    ),
                  ),
                  const CloseButton(),
                ],
              ),
            ),
            const VerticalSeparator.small(),
            CalendarDatePicker(
              initialDate: date,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              onDateChanged: (val) {
                Navigator.of(context).pop();
                onChangeDate(val);
              },
            ),
            const VerticalSeparator.large(),
          ],
        );
      },
    );
  }

  handleCreate() async {
    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    widget.createTodoController
        .createTodo(
      title: titleController.text,
      date: date,
      file: pickedFile,
    )
        .then(
      (value) {
        value.fold(
          (failure) => OnzeErrorSnackBar(
            message: failure.message,
          ).show(snackbarKey),
          (success) => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnzeUnfocuser(
      child: Scaffold(
        appBar: OnzeAppBar(
          titleText: Messages.instance.lang.createTodo,
        ),
        body: RxBuilder(builder: (context) {
          final state = widget.createTodoController.state;

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
                      const VerticalSeparator.small(),
                      OnzePickerButton(
                        icon: Icons.calendar_today,
                        onTap: handleChooseDate,
                        label: Messages.instance.lang.date,
                        text: DateFormat.MMMMEEEEd().format(date).capitalize(),
                      ),
                      const VerticalSeparator.regular(),
                      SelectFileTypeModal(
                        onChangeFile: onChooseFile,
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }),
        bottomNavigationBar: RxBuilder(builder: (context) {
          final isLoading = widget.createTodoController.state is Loading;

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

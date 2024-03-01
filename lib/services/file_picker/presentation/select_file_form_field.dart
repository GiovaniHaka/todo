import 'package:flutter/material.dart';
import 'package:todo/core/binders/binder.dart';
import 'package:todo/globals/constants/radius_constants.dart';
import 'package:todo/globals/messages/messages.dart';
import 'package:todo/globals/ui/buttons/onze_small_filled_button.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/services/file_picker/domain/models/picked_file_entity.dart';
import 'package:todo/services/file_picker/domain/usecases/pick_local_file_usecase.dart';

class SelectFileTypeModal extends StatelessWidget {
  final ValueChanged<PickedFile> onChangeFile;

  const SelectFileTypeModal({
    Key? key,
    required this.onChangeFile,
  }) : super(key: key);

  show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(regularRadius),
        ),
      ),
      constraints: const BoxConstraints(maxHeight: 300),
      builder: (_) {
        return this;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final pickFileUsecase = getIt<PickLocalFileUsecase>();

    handlePickImage() async {
      Navigator.pop(context);

      final pickedFile = await pickFileUsecase.singleImage();

      if (pickedFile == null) {
        return;
      }

      onChangeFile(pickedFile);
    }

    return Container(
      padding: const EdgeInsets.all(regularRadius),
      decoration: BoxDecoration(
        color: OnzeColors.greyLightest,
        borderRadius: BorderRadius.circular(regularRadius),
      ),
      child: Row(
        children: [
          OnzeSmallFilledButton.primary(
            onTap: handlePickImage,
            text: Messages.instance.lang.buttonPickImage,
          )
        ],
      ),
    );
  }
}

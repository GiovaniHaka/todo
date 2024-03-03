import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo/core/binders/binder.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/constants/radius_constants.dart';
import 'package:todo/globals/messages/messages.dart';
import 'package:todo/globals/ui/buttons/onze_small_filled_button.dart';
import 'package:todo/globals/ui/separators/separators.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/services/file_picker/domain/models/picked_file_entity.dart';
import 'package:todo/services/file_picker/domain/usecases/pick_local_file_usecase.dart';

class SelectFileTypeModal extends StatefulWidget {
  final ValueChanged<PickedFile?> onChangeFile;

  const SelectFileTypeModal({
    Key? key,
    required this.onChangeFile,
  }) : super(key: key);

  @override
  State<SelectFileTypeModal> createState() => _SelectFileTypeModalState();
}

class _SelectFileTypeModalState extends State<SelectFileTypeModal> {
  final pickFileUsecase = getIt<PickLocalFileUsecase>();
  File? file;

  handlePickImage() async {
    final pickedFile = await pickFileUsecase.singleImage();

    setState(() {
      if (pickedFile == null) {
        return;
      }

      file = pickedFile.file;

      widget.onChangeFile(pickedFile);
    });
  }

  handleRemoveImage() {
    setState(() {
      file = null;
      widget.onChangeFile(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(smallPadding),
      decoration: BoxDecoration(
        color: OnzeColors.greyLightest,
        borderRadius: BorderRadius.circular(regularRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(regularRadius),
            child: SizedBox(
              width: 60,
              height: 60,
              child: Builder(builder: (context) {
                if (file == null) {
                  return const Icon(
                    Icons.image,
                    color: OnzeColors.greyRegular,
                    size: 30,
                  );
                }

                return Image.file(
                  file!,
                  fit: BoxFit.cover,
                );
              }),
            ),
          ),
          if (file != null) ...[
            const HorizontalSeparator.verySmall(),
            OnzeSmallFilledButton.secondary(
              onTap: handleRemoveImage,
              text: Messages.instance.lang.buttonRemove,
            ),
            const Spacer(),
          ],
          OnzeSmallFilledButton.primary(
            onTap: handlePickImage,
            text: Messages.instance.lang.buttonPickImage,
          )
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo/core/binders/binder.dart';
import 'package:todo/globals/constants/image_constants.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/constants/radius_constants.dart';
import 'package:todo/globals/messages/messages.dart';
import 'package:todo/globals/ui/buttons/onze_small_filled_button.dart';
import 'package:todo/globals/ui/separators/separators.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/services/file_picker/domain/models/picked_file_entity.dart';
import 'package:todo/services/file_picker/domain/usecases/pick_local_file_usecase.dart';

/// Classe que representa um modal para seleção de tipo de arquivo.
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
      padding: const EdgeInsets.all(regularPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(regularRadius),
        border: Border.all(
          color: OnzeColors.greyLight,
          width: 1.3,
        ),
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
                  // return const SizedBox.shrink();
                  return Image.asset(
                    ImageConstants.imagePlaceholder,
                    fit: BoxFit.cover,
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
            const HorizontalSeparator.small(),
            OnzeSmallFilledButton.secondary(
              onTap: handleRemoveImage,
              icon: Icons.close,
              text: Messages.instance.lang.buttonRemove,
            ),
          ],
          const Spacer(),
          OnzeSmallFilledButton.secondary(
            onTap: handlePickImage,
            text: file == null
                ? Messages.instance.lang.buttonChoose
                : Messages.instance.lang.buttonChange,
          )
        ],
      ),
    );
  }
}

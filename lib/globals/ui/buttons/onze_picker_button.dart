import 'package:flutter/material.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/constants/radius_constants.dart';
import 'package:todo/globals/messages/messages.dart';
import 'package:todo/globals/ui/buttons/onze_small_filled_button.dart';
import 'package:todo/globals/ui/separators/separators.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';

/// Classe que representa um botão de escolha do Onze.
class OnzePickerButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final bool isLoading;
  final String? label;
  final IconData? icon;
  final bool isComplete;

  const OnzePickerButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.icon,
    this.label,
    this.isLoading = false,
    this.isComplete = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(regularRadius),
        border: Border.all(
          color: OnzeColors.greyLight,
          width: 1.3,
        ),
      ),
      padding: const EdgeInsets.all(regularPadding),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 20,
            ),
            const HorizontalSeparator.small(),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (label != null) ...[
                  Text(
                    label!,
                    style: OnzeTextStyle.labelLarge().copyWith(
                      color: OnzeColors.greyDark,
                    ),
                  ),
                ],
                if (text != null) ...[
                  const VerticalSeparator.text(),
                  Text(
                    text!,
                    style: OnzeTextStyle.form(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          OnzeSmallFilledButton.secondary(
            text: isComplete
                ? Messages.instance.lang.buttonChoose
                : Messages.instance.lang.buttonChange,
            onTap: onTap,
            isLoading: isLoading,
            icon: isComplete ? Icons.check_circle : null,
          ),
          // Builder(
          //   builder: (context) {
          //     if (onChanged != null) {
          //       return OnzeSwitch(
          //         value: booleanValue,
          //         onChanged: onChanged!,
          //       );
          //     }

          //     if (isLoading) {
          //       return const SizedBox(
          //         height: 20,
          //         width: 20,
          //         child: OnzeCircularProgress(),
          //       );
          //     }

          //     if (isComplete) {
          //       return const Icon(
          //         Onzecons.checkCircleFilled,
          //         color: OnzeColors.primaryRegular,
          //       );
          //     }

          //     return const SizedBox.shrink();
          //   },
          // ),
        ],
      ),
    );
  }
}

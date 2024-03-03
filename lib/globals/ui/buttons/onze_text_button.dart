import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/ui/progress_indicators/onze_small_circular_progress.dart';
import 'package:todo/globals/ui/separators/separators.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';

/// Classe que representa um botão de texto do Onze.
class OnzeTextButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color? textColor;
  final EdgeInsets padding;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isLoading;
  final double iconSize;

  const OnzeTextButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.padding = const EdgeInsets.all(regularPadding),
    this.prefixIcon,
    this.suffixIcon,
    this.isLoading = false,
    this.textColor = Colors.black,
    this.iconSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = onTap == null ? OnzeColors.greyRegular : textColor;

    return CupertinoButton(
      padding: padding,
      disabledColor: OnzeColors.greyLight,
      onPressed: onTap,
      child: Builder(builder: (context) {
        if (isLoading) {
          return const OnzeSmallCircularProgress();
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) ...[
              Icon(
                prefixIcon,
                size: iconSize,
                color: color,
              ),
              const HorizontalSeparator.verySmall(),
            ],
            Text(
              text,
              style: OnzeTextStyle.button().copyWith(
                color: color,
              ),
            ),
            if (suffixIcon != null)
              Icon(
                suffixIcon,
                size: iconSize,
                color: color,
              ),
          ],
        );
      }),
    );
  }

  const OnzeTextButton.primary({
    Key? key,
    required String text,
    required Function()? onTap,
    EdgeInsets padding = const EdgeInsets.all(regularPadding),
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool isLoading = false,
  }) : this(
          key: key,
          text: text,
          onTap: onTap,
          padding: padding,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          isLoading: isLoading,
          textColor: OnzeColors.primaryRegular,
        );
}

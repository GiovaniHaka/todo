import 'package:flutter/material.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/ui/progress_indicators/onze_small_circular_progress.dart';
import 'package:todo/globals/ui/separators/separators.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';

enum OnzeIconButtonSize {
  small,
  medium,
}

class OnzeIconButton extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String? text;
  final bool border;
  final bool isLoading;
  final OnzeIconButtonSize? size;

  const OnzeIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.text,
    this.border = false,
    this.isLoading = false,
    this.size = OnzeIconButtonSize.medium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final double iconSize;
    late final TextStyle textStyle;

    if (size == OnzeIconButtonSize.small) {
      iconSize = 18.0;
      textStyle = OnzeTextStyle.buttonSmall();
    }

    if (size == OnzeIconButtonSize.medium) {
      iconSize = 22.0;
      textStyle = OnzeTextStyle.buttonMedium();
    }

    final buttonShape = text == null
        ? const CircleBorder()
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: border
                ? BorderSide(
                    color: foregroundColor ?? OnzeColors.primaryRegular,
                    width: 1.5,
                  )
                : BorderSide.none,
          );

    final padding = text == null
        ? const EdgeInsets.all(verySmallPadding)
        : const EdgeInsets.symmetric(
            vertical: verySmallPadding,
            horizontal: regularPadding,
          );

    return Material(
      shape: buttonShape,
      color: backgroundColor ?? Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: buttonShape,
        child: Padding(
          padding: padding,
          child: Builder(
            builder: (context) {
              if (isLoading) {
                return Center(
                  child: OnzeSmallCircularProgress(
                    color: foregroundColor,
                  ),
                );
              }

              final iconWidget = Icon(
                icon,
                size: iconSize,
                color: onTap == null ? OnzeColors.greyLight : foregroundColor,
              );

              if (text != null) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    iconWidget,
                    const HorizontalSeparator.verySmall(),
                    Text(
                      text!,
                      style: textStyle.copyWith(
                        color: foregroundColor,
                      ),
                    ),
                  ],
                );
              }

              return iconWidget;
            },
          ),
        ),
      ),
    );
  }

  factory OnzeIconButton.primary({
    Key? key,
    required IconData icon,
    required Function()? onTap,
    bool isLoading = false,
    String? text,
    OnzeIconButtonSize? size,
  }) {
    return OnzeIconButton(
      key: key,
      icon: icon,
      onTap: onTap,
      size: size ?? OnzeIconButtonSize.medium,
      text: text,
      isLoading: isLoading,
      backgroundColor: OnzeColors.primaryRegular,
      foregroundColor: Colors.black,
    );
  }

  factory OnzeIconButton.secondary({
    Key? key,
    required IconData icon,
    required Function()? onTap,
    bool isLoading = false,
    String? text,
    OnzeIconButtonSize? size,
  }) {
    return OnzeIconButton(
      key: key,
      icon: icon,
      onTap: onTap,
      text: text,
      size: size ?? OnzeIconButtonSize.medium,
      isLoading: isLoading,
      backgroundColor: OnzeColors.greyLightest,
      foregroundColor: Colors.black,
    );
  }
}

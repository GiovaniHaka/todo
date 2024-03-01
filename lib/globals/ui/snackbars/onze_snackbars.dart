import 'package:flutter/material.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';

class BaseSnackBar extends SnackBar {
  BaseSnackBar({
    Key? key,
    required String message,
    required String? actionLabel,
    required Color backgroundColor,
    required Color foregroundColor,
  }) : super(
          key: key,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: viewPadding),
          padding: const EdgeInsets.all(mediumPadding),
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          duration: const Duration(seconds: 4),
          content: Row(
            children: [
              Expanded(
                child: Text(
                  message,
                  style: OnzeTextStyle.bodyMedium(),
                ),
              ),
            ],
          ),
        );

  show(
    GlobalKey<ScaffoldMessengerState> key,
  ) {
    key.currentState?.clearSnackBars();
    key.currentState?.showSnackBar(this);
  }
}

class OnzeErrorSnackBar extends BaseSnackBar {
  OnzeErrorSnackBar({
    Key? key,
    required String message,
    VoidCallback? actionOnPressed,
    String? actionLabel,
  }) : super(
          key: key,
          message: message,
          actionLabel: actionLabel,
          backgroundColor: OnzeColors.redLightest,
          foregroundColor: OnzeColors.redDarkest,
        );
}

class OnzeSuccessSnackBar extends BaseSnackBar {
  OnzeSuccessSnackBar({
    Key? key,
    required String message,
    VoidCallback? actionOnPressed,
    String? actionLabel,
  }) : super(
          key: key,
          message: message,
          actionLabel: actionLabel,
          backgroundColor: OnzeColors.greenLightest,
          foregroundColor: OnzeColors.greenDarkest,
        );
}

showSnackBar({
  required GlobalKey<ScaffoldMessengerState> key,
  required BaseSnackBar snackBar,
}) {
  key.currentState?.clearSnackBars();
  key.currentState?.showSnackBar(snackBar);
}

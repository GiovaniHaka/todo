import 'package:flutter/material.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/ui/progress_indicators/onze_circular_progress.dart';
import 'package:todo/globals/ui/separators/separators.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';

class LoadingView extends StatelessWidget {
  final String message;

  const LoadingView({
    Key? key,
    this.message = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(largePadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: OnzeCircularProgress(),
          ),
          const VerticalSeparator.regular(),
          Text(
            message,
            style: OnzeTextStyle.titleSmall(),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/globals/messages/messages.dart';
import 'package:todo/globals/ui/separators/separators.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';

class FailureView extends StatelessWidget {
  final Failure? failure;

  const FailureView({
    Key? key,
    this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(viewPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              Messages.instance.lang.failureTitle,
              style: OnzeTextStyle.headlineSmall(),
            ),
          ),
          const VerticalSeparator.verySmall(),
          Text(
            failure?.message ?? Messages.instance.lang.failureDefaultMessage,
            textAlign: TextAlign.center,
            style: OnzeTextStyle.bodyLarge(),
          ),
        ],
      ),
    );
  }
}

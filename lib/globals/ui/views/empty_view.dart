import 'package:flutter/material.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';

class EmptyView extends StatelessWidget {
  final String message;

  const EmptyView({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(viewPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: OnzeTextStyle.bodyLarge(),
          ),
        ],
      ),
    );
  }
}

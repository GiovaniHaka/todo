import 'package:flutter/material.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';

/// Classe que representa a AppBar padrão do aplicativo.
class OnzeAppBar extends AppBar {
  OnzeAppBar({
    Key? key,
    String? titleText,
    Widget? title,
    Widget? leading,
    List<Widget>? actions,
    Color? backgroundColor,
    bool automaticallyImplyLeading = true,
  }) : super(
          key: key,
          title: title ?? _TitleText(title: titleText ?? ''),
          centerTitle: true,
          elevation: 0,
          actions: [
            ...actions ?? [],
            const SizedBox(width: 10),
          ],
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          backgroundColor: backgroundColor ?? OnzeColors.backgroundColor,
          surfaceTintColor: Colors.transparent,
        );
}

class _TitleText extends StatelessWidget {
  final String title;

  const _TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: OnzeTextStyle.titleMedium(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/messages/messages.dart';
import 'package:todo/globals/ui/buttons/onze_text_button.dart';
import 'package:todo/globals/ui/separators/separators.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';

/// Tela que representa uma rota não encontrada.
class RouteNotFoundScreen extends StatelessWidget {
  final Function()? onTap;

  const RouteNotFoundScreen({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(regularPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Messages.instance.lang.notFoundRouteTitle,
                  style: OnzeTextStyle.headlineSmall(),
                  textAlign: TextAlign.center,
                ),
                const VerticalSeparator.regular(),
                Text(
                  Messages.instance.lang.notFoundRouteSubtitle,
                  style: OnzeTextStyle.bodyMedium(),
                  textAlign: TextAlign.center,
                ),
                if (onTap != null)
                  OnzeTextButton(
                    text: Messages.instance.lang.buttonBackToHome,
                    onTap: onTap,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

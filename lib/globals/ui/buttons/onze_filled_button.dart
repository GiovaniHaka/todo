import 'package:flutter/material.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/ui/progress_indicators/onze_circular_progress.dart';
import 'package:todo/globals/ui/separators/separators.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';

/// Classe que representa um botão preenchido do Onze.
class OnzeFilledButton extends StatelessWidget {
  final Function()? onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final bool isLoading;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const OnzeFilledButton({
    Key? key,
    required this.onTap,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    this.isLoading = false,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextAlign textAlign = TextAlign.center;

    if (prefixIcon != null) {
      textAlign = TextAlign.start;
    }

    if (suffixIcon != null) {
      textAlign = TextAlign.start;
    }

    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return OnzeColors.greyLight;
              }
              return backgroundColor;
            },
          ),
          elevation: MaterialStateProperty.resolveWith<double?>(
            (Set<MaterialState> states) {
              return 0;
            },
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(regularButtonPadding),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return foregroundColor;
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return foregroundColor.withOpacity(0.2);
            },
          ),
          textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
            (Set<MaterialState> states) {
              return OnzeTextStyle.button();
            },
          ),
        ),
        child: isLoading
            ? FittedBox(
                child: OnzeCircularProgress(
                  color: foregroundColor,
                ),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: suffixIcon != null
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) ...[
                    Icon(
                      prefixIcon,
                      size: 22,
                      color: foregroundColor,
                    ),
                    const HorizontalSeparator.verySmall(),
                  ],
                  Expanded(
                    child: Text(
                      text,
                      textAlign: textAlign,
                    ),
                  ),
                  if (suffixIcon != null) ...[
                    const HorizontalSeparator.verySmall(),
                    Icon(
                      suffixIcon,
                      size: 22,
                      color: foregroundColor,
                    ),
                  ],
                ],
              ),
      ),
    );
  }

  const OnzeFilledButton.primary({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor = OnzeColors.primaryRegular,
    this.foregroundColor = Colors.black,
    this.isLoading = false,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  const OnzeFilledButton.secondary({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor = OnzeColors.greyLightest,
    this.foregroundColor = OnzeColors.primaryRegular,
    this.isLoading = false,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);
}

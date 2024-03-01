import 'package:flutter/material.dart';
import 'package:todo/globals/constants/radius_constants.dart';
import 'package:todo/globals/ui/progress_indicators/onze_circular_progress.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';

class OnzeSmallFilledButton extends StatelessWidget {
  final Function()? onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData? icon;
  final String? text;
  final bool isLoading;

  const OnzeSmallFilledButton({
    Key? key,
    required this.onTap,
    required this.backgroundColor,
    required this.foregroundColor,
    this.text,
    this.isLoading = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: onTap,
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
            const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(smallRadius),
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
              return OnzeTextStyle.buttonSmall().copyWith(
                color: foregroundColor,
              );
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      size: 16,
                      color: foregroundColor,
                    ),
                  ],
                  if (icon != null && text != null) const SizedBox(width: 5),
                  if (text != null)
                    Text(
                      text!,
                      textAlign: TextAlign.center,
                    ),
                  if (icon != null && text != null) const SizedBox(width: 5),
                ],
              ),
      ),
    );
  }

  const OnzeSmallFilledButton.primary({
    Key? key,
    this.text,
    required this.onTap,
    this.backgroundColor = OnzeColors.primaryRegular,
    this.foregroundColor = Colors.white,
    this.isLoading = false,
    this.icon,
  }) : super(key: key);

  const OnzeSmallFilledButton.secondary({
    Key? key,
    this.text,
    required this.onTap,
    this.backgroundColor = OnzeColors.greyLightest,
    this.foregroundColor = OnzeColors.primaryRegular,
    this.isLoading = false,
    this.icon,
  }) : super(key: key);
}

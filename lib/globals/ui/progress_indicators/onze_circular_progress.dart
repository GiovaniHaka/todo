import 'package:flutter/material.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';

/// Classe que representa um CircularProgressIndicator do Onze.
class OnzeCircularProgress extends CircularProgressIndicator {
  const OnzeCircularProgress({
    Key? key,
    Color? color,
    double? value,
    double? strokeWidth,
  }) : super(
          key: key,
          strokeWidth: 2,
          color: color ?? OnzeColors.primaryRegular,
          value: value,
        );
}

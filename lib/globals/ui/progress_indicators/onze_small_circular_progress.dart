import 'package:flutter/material.dart';
import 'package:todo/globals/ui/progress_indicators/onze_circular_progress.dart';

/// Classe que representa um CircularProgressIndicator pequeno do Onze.
class OnzeSmallCircularProgress extends StatelessWidget {
  final bool? center;
  final Color? color;

  const OnzeSmallCircularProgress({
    Key? key,
    this.color,
    this.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double value = 20;

    return Builder(builder: (_) {
      final circularProgress = SizedBox(
        height: value,
        width: value,
        child: OnzeCircularProgress(
          color: color ?? Colors.black,
        ),
      );

      if (center == true) {
        return Center(
          child: circularProgress,
        );
      }

      return circularProgress;
    });
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/constants/radius_constants.dart';

/// Classe que representa um container com efeito de vidro.
class OnzeGlassMorphismContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double opacity;
  final double blur;
  final BorderRadiusGeometry borderRadius;

  const OnzeGlassMorphismContainer({
    Key? key,
    required this.child,
    this.color = Colors.white,
    this.opacity = 0.1,
    this.blur = 5,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(regularRadius),
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: const EdgeInsets.all(smallPadding),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(opacity),
                color.withOpacity(opacity),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            borderRadius: borderRadius,
            border: Border.all(
              width: 1.5,
              color: color.withOpacity(0.1),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo/globals/constants/separator_constants.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';

/// Classe que representa um separador vertical.
class VerticalSeparator extends StatelessWidget {
  final bool showDivider;
  final double height;
  final Color? color;

  const VerticalSeparator({
    Key? key,
    this.height = regularSeparator,
    this.showDivider = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: showDivider ? Divider(height: 1, color: color) : null,
    );
  }

  const VerticalSeparator.large({
    Key? key,
    this.height = 48,
    this.showDivider = false,
    this.color,
  }) : super(key: key);

  const VerticalSeparator.medium({
    Key? key,
    this.height = 32,
    this.showDivider = false,
    this.color,
  }) : super(key: key);

  const VerticalSeparator.regular({
    Key? key,
    this.height = 24,
    this.showDivider = false,
    this.color,
  }) : super(key: key);

  const VerticalSeparator.small({
    Key? key,
    this.height = 16,
    this.showDivider = false,
    this.color,
  }) : super(key: key);

  const VerticalSeparator.verySmall({
    Key? key,
    this.height = 8,
    this.showDivider = false,
    this.color,
  }) : super(key: key);

  const VerticalSeparator.text({
    Key? key,
    this.height = 4,
    this.showDivider = false,
    this.color,
  }) : super(key: key);
}

/// Classe que representa um separador horizontal.
class HorizontalSeparator extends StatelessWidget {
  final bool showDivider;
  final double width;
  final Color? color;

  const HorizontalSeparator({
    Key? key,
    this.showDivider = false,
    this.width = regularSeparator,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (showDivider) {
        return VerticalDivider(
          width: width,
          thickness: 2,
          color: color ?? OnzeColors.greyLight,
        );
      }

      return SizedBox(width: width);
    });
  }

  const HorizontalSeparator.large({
    Key? key,
    this.width = 48,
    this.showDivider = false,
    this.color,
  }) : super(key: key);

  const HorizontalSeparator.medium({
    Key? key,
    this.width = 30,
    this.showDivider = false,
    this.color,
  }) : super(key: key);

  const HorizontalSeparator.regular({
    Key? key,
    this.width = 24,
    this.showDivider = false,
    this.color,
  }) : super(key: key);

  const HorizontalSeparator.small({
    Key? key,
    this.width = 16,
    this.showDivider = false,
    this.color,
  }) : super(key: key);

  const HorizontalSeparator.verySmall({
    Key? key,
    this.width = 8,
    this.showDivider = false,
    this.color,
  }) : super(key: key);
}

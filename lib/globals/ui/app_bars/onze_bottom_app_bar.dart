import 'package:flutter/material.dart';
import 'package:todo/globals/constants/padding_constants.dart';

/// Barra de navegação inferior personalizada.
class OnzeBottomAppBar extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const OnzeBottomAppBar({
    Key? key,
    this.child,
    this.padding,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.transparent,
      child: SafeArea(
        child: Padding(
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: viewPadding,
                vertical: smallPadding,
              ),
          child: child,
        ),
      ),
    );
  }
}

// class OnzeBottomAppBar extends BottomAppBar {
//   const OnzeBottomAppBar({
//     Key? key,
//     Widget? child,
//     double? elevation,
//     EdgeInsetsGeometry? padding,
//   }) : super(
//           key: key,
//           child: child,
//           padding: padding ??
//               const EdgeInsets.symmetric(
//                 horizontal: viewPadding,
//                 vertical: smallPadding,
//               ),
//           elevation: elevation ?? 0,
//           surfaceTintColor: Colors.transparent,
//         );
// }

import 'package:flutter/material.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';

class TodoCheckSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const TodoCheckSwitch({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const double size = 25;

    handleChange() {
      onChanged?.call(!value);
    }

    return GestureDetector(
      onTap: handleChange,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value ? OnzeColors.greenDarkest : Colors.transparent,
          border: value
              ? null
              : Border.all(
                  color: OnzeColors.greyRegular,
                  width: 2,
                ),
        ),
        child: Center(
          child: Icon(
            Icons.check_rounded,
            color: value ? OnzeColors.greenLightest : OnzeColors.greyRegular,
            size: 20,
          ),
        ),
      ),
    );
  }
}

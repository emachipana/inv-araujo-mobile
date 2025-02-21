import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/models/button_type.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onClick;
  final ButtonType type;
  final double size;
  final FontWeight textWeight;

  const Button({
    super.key,
    required this.text,
    required this.onClick,
    this.icon,
    this.type = ButtonType.primary,
    this.size = 16,
    this.textWeight = FontWeight.w500,
  });

  Map<String, Color> getColor() {
    Map<String, Color> defaultColor = {
      "color": AppColors.persian,
      "hover": AppColors.persianHover
    };

    Map<ButtonType, Map<String, Color>> colors = {
      ButtonType.primary: defaultColor,
      ButtonType.secondary: {"color": AppColors.dark, "hover": AppColors.gray},
    };

    return colors[type] ?? defaultColor;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Color> buttonColor = getColor();

    return TextButton(
      onPressed: onClick,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) return buttonColor["hover"];
          return buttonColor["color"];
        }),
        foregroundColor: WidgetStateProperty.all(AppColors.white),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        if (icon != null) ...[
          Icon(
            icon,
            size: size + 4,
            color: AppColors.white,
          )
        ],
        Text(
          text,
          style: TextStyle(
            fontSize: size,
            fontWeight: textWeight,
          ),
        )
      ]),
    );
  }
}

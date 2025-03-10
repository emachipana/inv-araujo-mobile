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
  final bool isLoading;

  const Button({
    super.key,
    required this.text,
    required this.onClick,
    this.icon,
    this.type = ButtonType.primary,
    this.size = 17,
    this.textWeight = FontWeight.w600,
    this.isLoading = false
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
          EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        if (isLoading) ...[
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 3),
          ),
          SizedBox(width: 10),
        ] else 
          if (icon != null) ...[
            Icon(
              icon,
              size: size + 4,
              color: AppColors.white,
            ),
            SizedBox(width: 10),
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

import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

class Link extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const Link({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: onClick,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.blue,
              color: AppColors.blue,
            ),
          ),
        ),
      ],
    );
  }
}

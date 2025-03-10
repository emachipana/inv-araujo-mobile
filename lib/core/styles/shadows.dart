import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

class Shadows {
  static BoxShadow shadow(int opacity) => BoxShadow(
    color: AppColors.dark.withAlpha(opacity),
    blurRadius: 6,
    spreadRadius: 1,
    offset: Offset(0, 4),
  );
}

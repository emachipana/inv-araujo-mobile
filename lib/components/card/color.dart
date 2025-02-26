import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';
import 'package:inv_araujo_mobile/core/styles/shadows.dart';

class CardColor extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String subtitle;
  final IconData? icon;

  const CardColor({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor,
          boxShadow: [
            Shadows.shadow(60)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(icon != null) ...[
                  Icon(icon, color: AppColors.white),
                  SizedBox(width: 5)
                ],
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: icon != null ? 22 : 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}

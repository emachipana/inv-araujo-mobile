import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';
import 'package:inv_araujo_mobile/core/styles/shadows.dart';
import 'package:inv_araujo_mobile/core/models/image.dart' as model;

class MiniProductCard extends StatelessWidget {
  final String name;
  final model.Image? img;
  final int stock;

  const MiniProductCard({
    required this.name,
    required this.stock,
    this.img,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        height: 100,
        width: 200,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 6),
        decoration: BoxDecoration(
          color: AppColors.smoke,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            Shadows.shadow(30),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(img?.url ?? "assets/img/default_product.png", width: 65),
            SizedBox(width: 1),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.dim,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "Stock:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.gray,
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        "$stock",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: stock <= 1 ? AppColors.red : AppColors.dim,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

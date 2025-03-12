import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';
import 'package:inv_araujo_mobile/core/styles/shadows.dart';

class WarehouseCard extends StatefulWidget {
  final String name;
  final String address;
  final int products;
  final bool isActive;
  final VoidCallback onClick;

  const WarehouseCard({
    required this.name,
    required this.address,
    required this.products,
    this.isActive = false,
    required this.onClick,
    super.key,
  });

  @override
  State<WarehouseCard> createState() => WarehouseCardState();
}

class WarehouseCardState extends State<WarehouseCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Container(
          width: 220,
          height: 140,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              Shadows.shadow(80),
            ],
            border: widget.isActive || isHovered
                ? Border.all(
                    color: AppColors.persianHover,
                    width: 2,
                  )
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 23,
                      color: AppColors.persianHover,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    widget.address,
                    style: TextStyle(
                      color: AppColors.dim,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Productos",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.dim,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "${widget.products}",
                    style: TextStyle(
                      color: AppColors.gray,
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

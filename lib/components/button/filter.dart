import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

class Filter extends StatefulWidget {
  final String name;
  final IconData? icon;
  final VoidCallback onClick;
  final bool isActive;

  const Filter({
    required this.name,
    required this.onClick,
    this.isActive = false,
    this.icon,
    super.key,
  });

  @override
  State<Filter> createState() => FilterState();
}

class FilterState extends State<Filter> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: TextButton(
        onPressed: widget.onClick,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isHovered || widget.isActive ? AppColors.dim : AppColors.smoke,
          ),
          foregroundColor: WidgetStateProperty.all(
            isHovered || widget.isActive ? AppColors.white : AppColors.dim,
          ),
          side: WidgetStateProperty.all(
            BorderSide(color: AppColors.dim, width: 1.5),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (widget.icon != null) ...[
              SizedBox(width: 10),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
                child: Icon(
                  widget.icon,
                  key: ValueKey<bool>(isHovered),
                  size: 20,
                  color: isHovered || widget.isActive ? AppColors.white : AppColors.dim,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? icon;
  final bool hasError;
  final String? errorMessage;
  final TextInputType inputType;
  final Function(String)? onChange;

  const Input({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.hasError = false,
    this.inputType = TextInputType.text,
    this.errorMessage,
    this.onChange,
    this.icon,
  });

  @override
  State<Input> createState() => InputState();
}

class InputState extends State<Input> {
  bool isTouched = false;
  Color getBorderColor() {
    if (!isTouched) return AppColors.taupe;
    if (widget.hasError) return AppColors.red;

    return AppColors.persian;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTouched(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: getBorderColor(), width: 2),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          children: [
            if (widget.icon != null) ...[
              Icon(widget.icon, color: getBorderColor()),
              SizedBox(width: 8),
            ],
            Expanded(
              child: TextField(
                controller: widget.controller,
                keyboardType: widget.inputType,
                onChanged: (value) => onChange(value),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  border: InputBorder.none
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTouched() {
    setState(() {
      if (!isTouched) {
        setState(() {
          isTouched = true;
        });
      }
    });
  }

  void onChange(value) {
    onTouched();
    widget.onChange!(value);
  }
}

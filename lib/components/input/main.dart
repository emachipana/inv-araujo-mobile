import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final GlobalKey<InputState>? inputKey;

  const Input({
    required this.controller,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.inputType = TextInputType.text,
    this.validator,
    this.inputKey,
  }) : super(key: inputKey);

  @override
  State<Input> createState() => InputState();
}

class InputState extends State<Input> {
  bool isTouched = false;
  bool isPasswordVisible = false;
  String? errorMessage;

  void validate() {
    setState(() {
      errorMessage = widget.validator?.call(widget.controller.text);
    });
  }

  void forceValidate() {
    setState(() {
      isTouched = true;
      validate();
    });
  }

  Color getBorderColor() {
    if (!isTouched) return AppColors.taupe;
    if (errorMessage != null) return AppColors.red;
    return AppColors.persian;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Focus(
          onFocusChange: (focus) {
            if (!isTouched) {
              setState(() => isTouched = true);
            }
            if (!focus) validate();
          },
          child: TextField(
            controller: widget.controller,
            keyboardType: widget.inputType,
            obscureText: widget.isPassword && !isPasswordVisible,
            style: TextStyle(
              color: AppColors.gray,
              fontFamily: "Nunito",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: AppColors.taupe,
              ),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon, color: getBorderColor())
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: getBorderColor(),
                      ),
                      onPressed: () => setState(
                          () => isPasswordVisible = !isPasswordVisible),
                    )
                  : (widget.suffixIcon != null
                      ? Icon(widget.suffixIcon, color: getBorderColor())
                      : null),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: getBorderColor(), width: 1.3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: getBorderColor(), width: 1.3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: getBorderColor(), width: 1.3),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.red, width: 1.3),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.red, width: 1.3),
              ),
            ),
            onChanged: (value) {
              setState(() {
                isTouched = true;
                validate();
              });
            },
          ),
        ),
        if (errorMessage != null) ...[
          SizedBox(height: 4),
          Text(
            errorMessage!,
            style: TextStyle(
              color: AppColors.red,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}

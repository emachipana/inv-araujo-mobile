import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

void showToast(BuildContext context, String? message, {bool isError = false}) {
  Flushbar(
    message: message,
    duration: Duration(seconds: 3),
    backgroundColor: isError ? AppColors.red : AppColors.persian,
    flushbarPosition: FlushbarPosition.TOP,
    margin: EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
  ).show(context);
}

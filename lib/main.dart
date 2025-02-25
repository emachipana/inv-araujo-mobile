import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/app.dart';
import 'package:inv_araujo_mobile/providers/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: InversionesApp(),
    ),
  );
}

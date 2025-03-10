import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/app.dart';
import 'package:inv_araujo_mobile/core/providers/auth.dart';
import 'package:inv_araujo_mobile/core/providers/data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DataProvider(),
        ),
      ],
      child: InversionesApp(),
    ),
  );
}

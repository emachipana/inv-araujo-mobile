import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/routes.dart';

class InversionesApp extends StatelessWidget {
  const InversionesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: "Inversiones Araujo",
      theme: ThemeData(fontFamily: "Nunito"),
    );
  }
}

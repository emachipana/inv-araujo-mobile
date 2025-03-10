import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:inv_araujo_mobile/routes.dart';

class InversionesApp extends StatelessWidget {
  const InversionesApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es_ES', null);
    Intl.defaultLocale = 'es_ES';

    return MaterialApp.router(
      routerConfig: appRouter,
      title: "Inversiones Araujo",
      theme: ThemeData(fontFamily: "Nunito"),
    );
  }
}

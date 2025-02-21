import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/screens/loader.dart';
import 'package:inv_araujo_mobile/screens/login.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    "loader": (_) => LoaderScreen(),
    "login": (_) => LoginScreen()
  };
}

import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    "login": (_) => throw Exception("Login route unimplemented"),
    "home": (_) => throw Exception("Home route unimplemented"),
  };
}

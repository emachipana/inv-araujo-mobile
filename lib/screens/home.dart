import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inv_araujo_mobile/providers/auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: ElevatedButton(onPressed: () {
        auth.logout();
        context.go("/home");
      }, child: Text("Cerrar sesión")),
    );
  }
}

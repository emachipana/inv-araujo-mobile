import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inv_araujo_mobile/components/button/option.dart';
import 'package:inv_araujo_mobile/core/providers/auth.dart';
import 'package:provider/provider.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});

  @override
  State<OptionsScreen> createState() => OptionsScreenState();
}

class OptionsScreenState extends State<OptionsScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Option(
              name: "Almacenes",
              icon: Icons.store,
              onClick: () => {},
            ),
            SizedBox(height: 10),
            Option(
              name: "Perfil",
              icon: Icons.person_pin,
              onClick: () => {},
            ),
            SizedBox(height: 10),
            Option(
              name: "Cerrar sesión",
              icon: Icons.logout_rounded,
              onClick: () async {
                await auth.logout();
                context.go("/login");
              },
            )
          ],
        ),
      ),
    );
  }
}

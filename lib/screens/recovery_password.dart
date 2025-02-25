import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inv_araujo_mobile/components/button/main.dart';
import 'package:inv_araujo_mobile/components/input/main.dart';
import 'package:inv_araujo_mobile/components/link/main.dart';
import 'package:inv_araujo_mobile/core/helpers/main.dart';
import 'package:inv_araujo_mobile/core/models/button_type.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

class RecoveryPasswordScreen extends StatefulWidget {
  const RecoveryPasswordScreen({super.key});

  @override
  State<RecoveryPasswordScreen> createState() => RecoveryPasswordState();
}

class RecoveryPasswordState extends State<RecoveryPasswordScreen> {
  final TextEditingController usernameController = TextEditingController();
  final GlobalKey<InputState> usernameKey = GlobalKey<InputState>();

  void onSubmit() {
    usernameKey.currentState?.forceValidate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.smoke,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/img/logo.png", width: 200),
              SizedBox(height: 40),
              Input(
                inputKey: usernameKey,
                controller: usernameController,
                hint: "Ingresa tu correo registrado",
                prefixIcon: Icons.email,
                inputType: TextInputType.emailAddress,
                validator: (value) {
                  if(value == null || value.isEmpty) return "El correo es obligatorio";
                  
                  if(!Helpers.emailRegex.hasMatch(value)) return "Correo no válido";
                  
                  return null;
                },
              ),
              SizedBox(height: 16),
              Link(
                text: "Iniciar sesión",
                onClick: () => context.go("/login"),
              ),
              SizedBox(height: 40),
              Button(
                text: "Enviar código",
                onClick: onSubmit,
                type: ButtonType.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

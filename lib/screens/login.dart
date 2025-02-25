import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inv_araujo_mobile/components/button/main.dart';
import 'package:inv_araujo_mobile/components/input/main.dart';
import 'package:inv_araujo_mobile/components/link/main.dart';
import 'package:inv_araujo_mobile/core/helpers/main.dart';
import 'package:inv_araujo_mobile/core/models/button_type.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';
import 'package:inv_araujo_mobile/providers/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<InputState> usernameKey = GlobalKey<InputState>();
  final GlobalKey<InputState> passwordKey = GlobalKey<InputState>();

  void onLogin(VoidCallback login) {
    usernameKey.currentState?.forceValidate();
    passwordKey.currentState?.forceValidate();

    if (usernameKey.currentState?.errorMessage == null &&
        passwordKey.currentState?.errorMessage == null) {
      login();
      context.go("/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

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
                hint: "Correo electrónico",
                prefixIcon: Icons.email,
                inputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El correo es obligatorio";
                  }

                  if (!Helpers.emailRegex.hasMatch(value)) {
                    return "Correo no válido";
                  }

                  return null;
                },
              ),
              SizedBox(height: 16),
              Input(
                inputKey: passwordKey,
                controller: passwordController,
                isPassword: true,
                hint: "Contraseña",
                prefixIcon: Icons.lock,
                inputType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "La contraseña es obligatoria";
                  }

                  if (value.length < 6) {
                    return "El mínimo son 6 caracteres";
                  }
                  
                  return null;
                },
              ),
              SizedBox(height: 16),
              Link(
                text: "Olvidé mi contraseña",
                onClick: () => context.go("/recovery"),
              ),
              SizedBox(height: 40),
              Button(
                text: "Iniciar sesión",
                onClick: () => onLogin(auth.login),
                type: ButtonType.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

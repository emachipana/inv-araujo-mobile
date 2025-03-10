import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => LoaderState();
}

class LoaderState extends State<LoaderScreen> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    progressLoading();
  }

  void progressLoading() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (progress < 1.0) {
        setState(() {
          progress += 0.2;
        });

        progressLoading();
      } else {
        context.go("/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.smoke,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/logo.png", width: 200),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200, // Tamaño del progress bar
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.platinium,
                color: AppColors.persian,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

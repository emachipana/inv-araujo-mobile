import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/components/navbar/bottom.dart';
import 'package:inv_araujo_mobile/components/navbar/top.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.smoke,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: TopNavbar(),
      ),
      body: SafeArea(child: child),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}

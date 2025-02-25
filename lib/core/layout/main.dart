import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/components/navbar/bottom.dart';
import 'package:inv_araujo_mobile/components/navbar/top.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: TopNavbar(),
      ),
      body: child,
      bottomNavigationBar: BottomNavbar(),
    );
  }
}

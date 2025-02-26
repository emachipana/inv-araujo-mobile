import 'package:flutter/material.dart';

class MiniProductCard extends StatelessWidget {
  final String name;
  final String img;
  final int stock;

  const MiniProductCard({
    required this.name,
    required this.img,
    required this.stock,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          
        ),
      ),
    );
  }
}

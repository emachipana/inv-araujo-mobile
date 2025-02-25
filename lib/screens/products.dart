import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => ProductsScreenState();
}

class ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Productoos"),
    );
  }
}

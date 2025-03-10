import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/styles/texts.dart';

class DeliveriesScreen extends StatefulWidget {
  const DeliveriesScreen({super.key});

  @override
  State<DeliveriesScreen> createState() => DeliveriesScreenState();
}

class DeliveriesScreenState extends State<DeliveriesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Entregas", style: TextStyles.title)
          ],
        ),
      ),
    );
  }
}

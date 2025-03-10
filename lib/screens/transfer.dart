import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/styles/texts.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => TransferScreenState();
}

class TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Traslado a agencia", style: TextStyles.title)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});

  @override
  State<OptionsScreen> createState() => OptionsScreenState();
}

class OptionsScreenState extends State<OptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Opcionees"),
    );
  }
}

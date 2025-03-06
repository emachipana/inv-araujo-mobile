import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});

  @override
  State<OptionsScreen> createState() => OptionsScreenState();
}

class OptionsScreenState extends State<OptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.store,
                      color: AppColors.gray,
                      size: 40,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Almacenes",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Divider(
                  color: AppColors.taupe,
                  thickness: 2,
                  height: 1,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_pin_circle,
                      color: AppColors.gray,
                      size: 40,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Perfil",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Divider(
                  color: AppColors.taupe,
                  thickness: 2,
                  height: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

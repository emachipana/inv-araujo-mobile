import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.persian,
      elevation: 0,
      toolbarHeight: 75,
      title: Row(
        children: [
          Image.asset(
            "assets/img/logo_min.png",
            height: 30,
          ),
          SizedBox(width: 10),
          Text(
            "Inversiones Araujo",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 19,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => {},
          icon: Icon(
            Icons.notifications_active_sharp,
            color: AppColors.white,
            size: 26,
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () => {},
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/img/default_avatar.jpg"),
            radius: 22,
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}

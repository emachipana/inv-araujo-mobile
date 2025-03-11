import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/styles/colors.dart';

class Option extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;
  final String? text;

  const Option({
    required this.name,
    required this.icon,
    required this.onClick,
    this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      color: AppColors.gray,
                      size: 35,
                    ),
                    SizedBox(width: 8),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
                if(text != null) Text(
                  text ?? "",
                  style: TextStyle(
                    color: AppColors.gray,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Divider(
            color: AppColors.taupe,
            thickness: 2,
            height: 1,
          ),
        ],
      ),
    );
  }
}

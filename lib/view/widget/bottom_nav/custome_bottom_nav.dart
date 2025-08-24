import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';

class CustomeBottomNav extends StatelessWidget {
  final void Function(int)? onTap;
  const CustomeBottomNav({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: AppColors.buttonText,
      activeColor: AppColors.brand,

      items: const [
        TabItem(icon: Icon(Icons.home_outlined, size: 30)),
        TabItem(icon: Icon(Icons.add, size: 30)),
        TabItem(icon: Icon(Icons.person, size: 30)),
      ],
      initialActiveIndex: 0,
      onTap: onTap,
    );
  }
}

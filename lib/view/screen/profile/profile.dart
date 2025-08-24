import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: Text("Profile")),
    );
  }
}

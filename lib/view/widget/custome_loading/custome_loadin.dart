import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';

class CustomeLoading extends StatelessWidget {
  const CustomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: AppColors.brand,
      strokeWidth: 4,),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/view/widget/custome_text/custome_text.dart';

class CustomeButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onTap;
  const CustomeButton({
    super.key,
    required this.buttonName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.brand,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: CustomeText(
            text: buttonName,
            color: AppColors.buttonText,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

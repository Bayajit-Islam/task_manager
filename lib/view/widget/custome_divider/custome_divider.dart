import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/view/widget/custome_text/custome_text.dart';

class CustomeDivider extends StatelessWidget {
  final String text;
  const CustomeDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 1.5, color: AppColors.state500)),
        //<==================== Text ====================>
        CustomeText(
          left: 8,
          right: 8,
          text: text,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.deviderText,
        ),

        Expanded(child: Divider(thickness: 1.5, color: AppColors.state500)),
      ],
    );
  }
}

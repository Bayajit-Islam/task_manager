import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';

class CustomeCheckbox extends StatelessWidget {
  final void Function(bool?)? onChanged;
  final bool value;
  const CustomeCheckbox({
    super.key,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: AppColors.brand,
      checkColor: Colors.black,
      side: BorderSide(color: AppColors.brand, width: 2),
      value: value,
      onChanged: onChanged,
    );
  }
}

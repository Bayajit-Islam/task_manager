import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/app_icons/app_icons.dart';
import 'package:task_manager/view/widget/custome_text/custome_text.dart';

// ignore: must_be_immutable
class ProfileTile extends StatelessWidget {
  final String icon;
  final String text;
  final void Function()? onPressed;
  final double? iconwidht;
  final double? sizeboxWidth;
  bool disableIcon;
  ProfileTile({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
    this.disableIcon = false,
    this.iconwidht = 24,
    this.sizeboxWidth =10
  });

// get profile 


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.buttonText,
            border: Border.all(width: 1, color: AppColors.buttonText),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: AppColors.dropshadow,
                offset: Offset(1, 1),
                blurRadius: 24,
                spreadRadius: 0,
              ),
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SizedBox(
                height: double.infinity,
                width: iconwidht,
                child: SvgPicture.asset(icon),
              ),
              SizedBox(width: sizeboxWidth),
              SvgPicture.asset(AppIcons.line),
              SizedBox(width: 10),
              CustomeText(
                text: text,
                fontSize: 14,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w400,
              ),
              Spacer(),
              disableIcon
                  ? SizedBox.shrink()
                  : Icon(Icons.chevron_right, color: AppColors.brand),
            ],
          ),
        ),
      ),
    );
  }
}

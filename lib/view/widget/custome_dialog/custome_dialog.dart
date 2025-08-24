import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/app_images/app_images.dart';
import 'package:task_manager/utils/app_static_string/app_static_string.dart';
import 'package:task_manager/view/widget/custome_text/custome_text.dart';

class CustomeDialog extends StatelessWidget {
  final bool iscencelButton;
  final void Function()? onTap;
  final void Function()? onOk;
  final String title;
  final String desc;

  const CustomeDialog({
    super.key,
    this.onTap,
    this.onOk,
    required this.iscencelButton,
    required this.title,
    required this.desc
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      shape: BeveledRectangleBorder(),
      content: Container(
        width: 250,
        decoration: BoxDecoration(
          color: AppColors.buttonText,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //waringin logo here
              iscencelButton
                  ? Image.asset(AppImages.warning)
                  : Image.asset(AppImages.confirmm),

              //title here
              CustomeText(
                text: title,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),

              //desc here
              CustomeText(
                text:desc,
                maxLines: 2,
                color: AppColors.state500,
              ),

              //button cencel here
              SizedBox(height: 10),
              iscencelButton
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DialogButton(
                          ontap: () {
                            Navigator.pop(context);
                          },
                          buttonText: AppString.cencel,
                          buttonTextColor: AppColors.brand,
                        ),
                        //button confrim here
                        DialogButton(
                          ontap: onTap,
                          buttonText: AppString.confirm,
                          buttonTextColor: AppColors.buttonText,
                          bgColor: AppColors.brand,
                        ),
                      ],
                    )
                  : DialogButton(
                      ontap: onOk,
                      buttonText: AppString.ok,
                      buttonTextColor: AppColors.buttonText,
                      bgColor: AppColors.brand,
                    ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Dialog button for only dialog
class DialogButton extends StatelessWidget {
  final void Function()? ontap;
  final Color? bgColor;
  final String buttonText;
  final Color buttonTextColor;
  const DialogButton({
    super.key,
    required this.ontap,
    this.bgColor,
    required this.buttonText,
    required this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 100,
        height: 32,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color: AppColors.brand),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: CustomeText(
          text: buttonText,
          fontSize: 16,
          color: buttonTextColor,
        ),
      ),
    );
  }
}

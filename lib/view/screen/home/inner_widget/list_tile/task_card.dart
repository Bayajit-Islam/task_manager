import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/model/task_model/task_model.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/app_icons/app_icons.dart';
import 'package:task_manager/utils/app_images/app_images.dart';
import 'package:task_manager/view/widget/custome_text/custome_text.dart';

class TaskCard extends StatelessWidget {
  final TaskModel taskModel;
  final void Function()? onTap;
  const TaskCard({super.key, required this.taskModel,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 141,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.profileAvater),
              fit: BoxFit.cover,
            ),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //icon here
                SvgPicture.asset(AppIcons.taskIcon),

                //title here
                SizedBox(height: 16),
                CustomeText(
                  text: taskModel.title,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),

                //descripton here
                SizedBox(height: 10),
                CustomeText(
                  text: taskModel.descripton,
                  textAlign: TextAlign.start,
                  fontSize: 12,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
    );
  }
}

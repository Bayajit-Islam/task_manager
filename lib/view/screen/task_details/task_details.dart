import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager/model/task_model/task_model.dart';
import 'package:task_manager/service/task_list.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/app_icons/app_icons.dart';
import 'package:task_manager/utils/app_static_string/app_static_string.dart';
import 'package:task_manager/view/widget/custome_button/my_button.dart';
import 'package:task_manager/view/widget/custome_dialog/custome_dialog.dart';
import 'package:task_manager/view/widget/custome_loading/custome_loadin.dart';
import 'package:task_manager/view/widget/custome_text/custome_text.dart';

// ignore: must_be_immutable
class TaskDetails extends StatelessWidget {
  TaskDetails({super.key});

  //get getx argument
  TaskModel task = Get.arguments;
  //dependecy inject
  TaskServie taskServie = Get.find<TaskServie>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.background,
        title: CustomeText(
          text: AppString.taskDetails,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.buttonText,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //TASK TITLE
                SizedBox(height: 20),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.titleIcon),
                    SizedBox(width: 4),
                    CustomeText(
                      text: AppString.taskTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                //INDIVIDULAL TITLE HERE
                SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(width: 20),
                    CustomeText(text: task.title, fontWeight: FontWeight.w500),
                  ],
                ),
                //DIVIDER
                SizedBox(height: 14),
                Divider(),
                SizedBox(height: 14),
                //TASK Description
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.descIcon),
                    SizedBox(width: 4),
                    CustomeText(
                      text: AppString.taskDescripton,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                //INDIVIDULAL Desc HERE
                SizedBox(height: 8),

                SizedBox(width: 20),

                CustomeText(
                  text: task.descripton,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.visible,
                ),

                //DIVIDER
                SizedBox(height: 14),
                Divider(),
                SizedBox(height: 14),

                //delet and edit task button
                Row(
                  children: [
                    MyButton(
                      icon: AppIcons.delet,
                      text: AppString.deletTask,
                      bgColor: AppColors.red50,
                      borderColor: AppColors.red500,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return //show warning
                            CustomeDialog(
                              iscencelButton: true,
                              title: AppString.warning,
                              desc: AppString.removetask,
                              onTap: () {
                                Navigator.pop(context);
                                //show loading
                                CustomeLoading();
                                //add to task
                                taskServie.deletTask(task);
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CustomeDialog(
                                      iscencelButton: false,
                                      title: AppString.succes,
                                      desc: AppString.addedSucces,
                                      onOk: () {
                                        Get.offAllNamed("/navBar");
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(width: 6),
                    MyButton(
                      icon: AppIcons.edit,
                      text: AppString.editTask,
                      bgColor: AppColors.softBrand,
                      borderColor: AppColors.brand,
                      onTap: () {
                        Get.toNamed("/edit_task", arguments: task);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

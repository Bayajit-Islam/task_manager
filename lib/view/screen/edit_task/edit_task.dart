import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/model/task_model/task_model.dart';
import 'package:task_manager/service/task_list.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/app_static_string/app_static_string.dart';
import 'package:task_manager/view/widget/custome_button/custome_button.dart';
import 'package:task_manager/view/widget/custome_dialog/custome_dialog.dart';
import 'package:task_manager/view/widget/custome_loading/custome_loadin.dart';
import 'package:task_manager/view/widget/custome_text/custome_text.dart';
import 'package:task_manager/view/widget/custome_textfield/custome_textfield.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  //<==================== task serive ====================>
  TaskModel task = Get.arguments;

  //<==================== title Text field  ====================>
  late TextEditingController titleController = TextEditingController(
    text: task.title,
  );

  //<==================== Desc Text Field  ====================>
  late TextEditingController descController = TextEditingController(
    text: task.descripton,
  );

  //<==================== task serive ====================>
  TaskServie taskServie = Get.find<TaskServie>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: CustomeText(
          text: AppString.editTask,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          children: [
            //TASK TITLE
            Row(
              children: [
                CustomeText(
                  text: AppString.taskTitle,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            //title textfield
            SizedBox(height: 6),
            CustomeTextfield(hintText: "", textfielController: titleController),

            //Descripton text
            SizedBox(height: 23),
            Row(
              children: [
                CustomeText(
                  text: AppString.taskDesc,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            //desc textfield
            SizedBox(height: 6),
            CustomeTextfield(
              hintText: "",
              textfielController: descController,
              maxLines: 3,
            ),

            //save task button
            SizedBox(height: 23),
            CustomeButton(
              buttonName: AppString.updateTask,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomeDialog(
                      iscencelButton: true,
                      title: AppString.warning,
                      desc: AppString.wantupdatetask,
                      onTap: () {
                        //pop  pages
                        Navigator.pop(context);
                        //show loading
                        CustomeLoading();
                        //update task
                        taskServie.updateTask(
                          task,
                          titleController.text,
                          descController.text,
                        );
                        //navigate home pages
                        Get.offAllNamed("/navBar");
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

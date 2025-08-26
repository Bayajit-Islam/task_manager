import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/controller/task_controller.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/app_static_string/app_static_string.dart';
import 'package:task_manager/view/widget/custome_button/custome_button.dart';
import 'package:task_manager/view/widget/custome_dialog/custome_dialog.dart';
import 'package:task_manager/view/widget/custome_loading/custome_loadin.dart';
import 'package:task_manager/view/widget/custome_text/custome_text.dart';
import 'package:task_manager/view/widget/custome_textfield/custome_textfield.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  //<==================== title Text field  ====================>
  final TextEditingController titleController = TextEditingController();

  //<==================== Desc Text Field  ====================>
  final TextEditingController descController = TextEditingController();

  //<==================== task serive ====================>
  TaskController taskController = Get.find<TaskController>();

  //<==================== Shoe Circular laoding  ====================>
  void showLoading() {
    showDialog(
      context: context,
      builder: (context) {
        return CustomeLoading();
      },
    );
  }

  //add to task method
  void addtoTask() {
    taskController.addtoTask(
      title: titleController.text,
      desc: descController.text,
    );
  }

  void popPages(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: CustomeText(
          text: AppString.addTask,
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
              buttonName: AppString.saveTask,
              onTap: () {
                //show warning
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomeDialog(
                      title: AppString.warning,
                      desc: AppString.addthistask,
                      iscencelButton: true,
                      onTap: () {
                        //pop warning  dailog
                        popPages(context);
                        //show loading
                        showLoading();
                        //pop loading
                        popPages(context);
                        //add to task
                        addtoTask();

                        showDialog(
                          context: context,
                          builder: (context) {
                            return CustomeDialog(
                              title: AppString.succes,
                              desc: AppString.addedSucces,
                              iscencelButton: false,
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
          ],
        ),
      ),
    );
  }
}

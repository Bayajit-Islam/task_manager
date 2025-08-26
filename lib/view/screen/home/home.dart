import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/controller/task_controller.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/app_images/app_images.dart';
import 'package:task_manager/utils/app_static_string/app_static_string.dart';
import 'package:task_manager/view/screen/home/inner_widget/list_tile/task_card.dart';
import 'package:task_manager/view/widget/custome_text/custome_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //dependecy  inject
  TaskController taskController = Get.find<TaskController>();

  @override
  void initState() {
    super.initState();
    taskController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      //appbar
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            child: Image.asset(AppImages.avater, fit: BoxFit.cover),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomeText(
              text: AppString.hello,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            CustomeText(
              text: AppString.wellcometoTaskManager,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),

      //body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                CustomeText(
                  text: AppString.myTask,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),

            //list card
            Expanded(
              child: Obx(() {
                if (taskController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (taskController.taskList.isEmpty) {
                  return Center(child: Text("No tasks found"));
                }
                return ListView.builder(
                  itemCount: taskController.taskList.length,
                  itemBuilder: (context, index) {
                    //get inidividual task
                    final task = taskController.taskList[index];
                    return TaskCard(
                      taskModel: task,
                      onTap: () {
                        Get.toNamed("/taskDetails", arguments: task);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:get/get.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/utils/api/app_url.dart';
import 'package:task_manager/utils/api/base_url.dart';

class TaskServie extends GetxService {
  RxList<TaskModel> taskList = <TaskModel>[].obs;
  var isLoading = false.obs;

  Future<void> getData() async {
    final response = await BaseClient.getRequest(api: AppUrl.myTask);

    try {
      isLoading.value = true;
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var dataList = jsonData["data"]["data"] as List;
        taskList.value = dataList
            .map((item) => TaskModel.fromJson(item))
            .toList();
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addtoTask({required String title, required String desc}) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{"title": title, "description": desc};

      final response = await BaseClient.postRequest(
        api: AppUrl.taskCreate,
        body: map,
      );

      if (response.statusCode == 201) {
        await getData();
      } else {
        Get.snackbar("Error", "Failed to add task: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "Please Try Again");
    } finally {
      isLoading(false);
    }
  }

  void deletTask(TaskModel taskmodel) {
    taskList.remove(taskmodel);
  }

  void updateTask(TaskModel taskmodel, String newTitle, newDesc) {
    int index = taskList.indexOf(taskmodel);
    if (index != -1) {
      taskList[index] = TaskModel(title: newTitle, descripton: newDesc);
    }
  }
}

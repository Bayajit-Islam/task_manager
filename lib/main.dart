import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/core/app_routes/app_routes.dart';
import 'package:task_manager/controller/task_controller.dart';
import 'package:task_manager/view/screen/splash_screen/splash_screen.dart';

void main() async {
  //dependency inject

  // ignore: unused_local_variable
  TaskController taskController = Get.put(TaskController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: AppRoutes.routes,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:task_manager/utils/app_animation/app_animation.dart';
import 'package:task_manager/view/screen/splash_screen/splash_controlle/splash_controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  //splash controller inject
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset(AppAnimation.splashScreen))
    );
  }
}

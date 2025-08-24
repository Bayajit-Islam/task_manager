import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/app_icons/app_icons.dart';
import 'package:task_manager/view/screen/splash_screen/splash_controlle/splash_controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  //splash controller inject
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: AppColors.background),
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/login_screen");
            },
            child: SvgPicture.asset(AppIcons.splashScreenIcon),
          ),
        ),
      ),
    );
  }
}

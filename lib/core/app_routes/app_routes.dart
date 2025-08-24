import 'package:flutter/widgets.dart';
import 'package:task_manager/view/screen/add_task/add_task.dart';
import 'package:task_manager/view/screen/auth_screen/login_screen/login_screen.dart';
import 'package:task_manager/view/screen/auth_screen/signup_screen/signup_screen.dart';
import 'package:task_manager/view/screen/edit_task/edit_task.dart';
import 'package:task_manager/view/screen/home/inner_widget/bottom_nav/bottom_nav.dart';
import 'package:task_manager/view/screen/home/home.dart';
import 'package:task_manager/view/screen/splash_screen/splash_screen.dart';
import 'package:task_manager/view/screen/task_details/task_details.dart';

class AppRoutes {
 static   Map<String, Widget Function(BuildContext)> routes = {
   //<==================== Splash Screen ====================>

    "/splash_screen":(context)=> SplashScreen(),

     //<==================== Auth Screen ====================>
     "/login_screen":(context)=> LoginScreen(),
     "/signup_screen":(context)=> SignupScreen(),

      //<==================== Home Screen ====================>
      "/home":(context)=> Home(),
      "/navBar":(context)=>  BottomNavBar(),

      "/taskDetails":(context)=> TaskDetails(),
      "/add_task":(context)=> AddTask(),
      "/edit_task":(context)=>  EditTask()

  };
}

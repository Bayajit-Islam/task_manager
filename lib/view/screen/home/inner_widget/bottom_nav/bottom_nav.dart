import 'package:flutter/material.dart';
import 'package:task_manager/view/screen/add_task/add_task.dart';
import 'package:task_manager/view/screen/home/home.dart';
import 'package:task_manager/view/screen/profile/profile.dart';
import 'package:task_manager/view/widget/bottom_nav/custome_bottom_nav.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  //current index
  int currentIndex = 0;

  //toggle
  void toggle(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  //pages
  final List _pages = [Home(), AddTask(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: CustomeBottomNav(
        onTap: toggle
        
      ),
    );
  }
}

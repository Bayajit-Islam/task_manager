import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/service/profile_user_controller.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/app_icons/app_icons.dart';
import 'package:task_manager/utils/app_static_string/app_static_string.dart';
import 'package:task_manager/view/screen/profile/inner_widget/inner_widget.dart';
import 'package:task_manager/view/widget/custome_text/custome_text.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  ProfileUserController user = Get.find<ProfileUserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: CustomeText(
          text: AppString.myProfile,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.brand,
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                // Profile image //  just static not dynamic
                image: DecorationImage(
                  image: NetworkImage(
                    "https://www.shutterstock.com/image-vector/default-avatar-profile-icon-social-600nw-1906669723.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: Colors.black, width: 1),
              ),
            ),
          ),
          SizedBox(height: 10),
          CustomeText(
            text: user.profile.value.name,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 20),
          ProfileTile(
            icon: AppIcons.profile,
            text: user.profile.value.name,
            disableIcon: true,
          ),

          ProfileTile(
            icon: AppIcons.email,
            text: user.profile.value.email,
            disableIcon: true,
          ),

          ProfileTile(
            icon: AppIcons.location,
            text: "null",
            disableIcon: true,
            iconwidht: 18,
            sizeboxWidth: 16,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/service/profile_user_controller.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/app_icons/app_icons.dart';
import 'package:task_manager/utils/app_images/app_images.dart';
import 'package:task_manager/utils/app_static_string/app_static_string.dart';
import 'package:task_manager/view/screen/profile/inner_widget/inner_widget.dart';
import 'package:task_manager/view/widget/custome_text/custome_text.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ProfileUserController user = Get.put(ProfileUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top background + profile image
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // Bennar
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.profileBennar),
                      fit: BoxFit.cover,
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.green.shade400, Colors.green.shade200],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                ),

                // Profile picture (hexagon style)
                Positioned(
                  bottom: -50,
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
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 61),
            Column(
              children: [
                //my profile
                ProfileTile(
                  icon: AppIcons.profile,
                  text: AppString.myProfile,
                  onPressed: () {
                    Get.toNamed("/myprofile");
                  },
                ),

                //account setting
                ProfileTile(
                  icon: AppIcons.accountSetting,
                  text: AppString.accountSetting,
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 16,
                    left: 16,
                    bottom: 2,
                  ),
                  child: Row(
                    children: [
                      CustomeText(
                        text: AppString.more,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ),

                //terms and condition
                ProfileTile(
                  icon: AppIcons.accountSetting,
                  text: AppString.accountSetting,
                ),

                //Privacy policy
                ProfileTile(
                  icon: AppIcons.privacy,
                  text: AppString.privacyPolicy,
                ),

                //terms and condition
                ProfileTile(icon: AppIcons.help, text: AppString.help),

                //logout
                ProfileTile(
                  icon: AppIcons.logOut,
                  text: AppString.logout,
                  disableIcon: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

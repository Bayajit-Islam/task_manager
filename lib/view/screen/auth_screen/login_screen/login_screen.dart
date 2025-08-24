import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/app_static_string/app_static_string.dart';
import 'package:task_manager/view/screen/auth_screen/login_screen/login_controller.dart/login_controller.dart';
import 'package:task_manager/view/widget/custome_button/custome_button.dart';
import 'package:task_manager/view/widget/custome_checkBox/custome_checkbox.dart';
import 'package:task_manager/view/widget/custome_divider/custome_divider.dart';
import 'package:task_manager/view/widget/custome_text/custome_text.dart';
import 'package:task_manager/view/widget/custome_textfield/custome_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // <==================== Email Controller  ====================>
  final TextEditingController emailController = TextEditingController();

  // <==================== Password Controller  ====================>
  final TextEditingController passwordController = TextEditingController();

  // <==================== CheckBox  ====================>
  bool rememberMe = false;

  void toggle() {
    setState(() {
      rememberMe = !rememberMe;
    });
  }

  // <==================== LoginController Inject  ====================>
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // //<==================== Wellcome Back Text  ====================>
            Row(
              children: [
                CustomeText(
                  text: AppString.wellcome,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),

            // <==================== Stay Productive Text  ====================>
            SizedBox(height: 8),
            Row(
              children: [
                CustomeText(
                  text: AppString.stayProductive,
                  fontSize: 14,
                  color: AppColors.secondaryText,
                ),
              ],
            ),

            // <==================== Email Text Field  ====================>
            SizedBox(height: 23),
            Row(
              children: [
                CustomeText(
                  text: AppString.emailAdrees,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(height: 6),
            CustomeTextfield(
              textfielController: emailController,
              hintText: AppString.hintextEmail,
            ),

            // <==================== Password Text Field  ====================>
            SizedBox(height: 23),
            Row(
              children: [
                CustomeText(
                  text: AppString.password,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(height: 6),
            CustomeTextfield(
              textfielController: passwordController,
              hintText: AppString.hintextPassword,
              isPassword: true,
            ),

            // <==================== Remember me and Forgot Possword  ====================>
            Row(
              children: [
                CustomeCheckbox(
                  onChanged: (value) => toggle(),
                  value: rememberMe,
                ),
                CustomeText(
                  text: AppString.rememberMe,
                  color: AppColors.grey700,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: CustomeText(
                    text: AppString.forgetPasseord,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.brand,
                  ),
                ),
              ],
            ),

            // <==================== Divider  ====================>
            SizedBox(height: 23),
            CustomeDivider(text: AppString.or),

            // <==================== Dont Have Account and sign up button  ====================>
            SizedBox(height: 23),
            Row(
              children: [
                CustomeText(
                  text: AppString.donthaveAccount,
                  fontSize: 14,
                  color: AppColors.grey700,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup_screen");
                  },
                  child: CustomeText(
                    text: AppString.signUp,
                    color: AppColors.brand,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            // <==================== Login Butoon  ====================>
            SizedBox(height: 23),
            Obx(() {
              return _loginController.isLoading.value == true
                  ? CircularProgressIndicator()
                  : CustomeButton(
                      buttonName: AppString.logIn,
                      onTap: () {
                        if (emailController.text.isEmpty ||
                            emailController.text.isEmpty) {
                          Get.snackbar(
                            backgroundColor: AppColors.red500,
                            "Warning...",
                            "Please Fill Email And Password",
                          );
                        } else {
                          _loginController.login(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                    );
            }),
          ],
        ),
      ),
    );
  }
}

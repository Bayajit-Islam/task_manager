import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';
import 'package:task_manager/utils/app_static_string/app_static_string.dart';
import 'package:task_manager/view/screen/auth_screen/signup_screen/controller/signup_controller.dart';
import 'package:task_manager/view/widget/custome_button/custome_button.dart';
import 'package:task_manager/view/widget/custome_checkBox/custome_checkbox.dart';
import 'package:task_manager/view/widget/custome_divider/custome_divider.dart';
import 'package:task_manager/view/widget/custome_text/custome_text.dart';
import 'package:task_manager/view/widget/custome_textfield/custome_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // <==================== Email Controller  ====================>
  final TextEditingController emailController = TextEditingController();

  // <==================== Password Controller  ====================>
  final TextEditingController passwordController = TextEditingController();

  // <==================== First Name Controller  ====================>
  final TextEditingController firstNameController = TextEditingController();

  // <==================== lastName Controller  ====================>
  final TextEditingController lastNameController = TextEditingController();

  // <==================== Address Controller  ====================>
  final TextEditingController addressController = TextEditingController();

  // <==================== Confirm Password Controller  ====================>
  final TextEditingController confirmPwController = TextEditingController();

  // <==================== CheckBox  ====================>
  bool agreeTearmAndCondition = false;

  // <==================== SignUpController Inject  ====================>
  final SignupController _signupController = Get.put(SignupController());

  void toggle() {
    setState(() {
      agreeTearmAndCondition = !agreeTearmAndCondition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // //<==================== Create Your Account Text  ====================>
                SizedBox(height: 96),
                Row(
                  children: [
                    CustomeText(
                      text: AppString.createAccuunt,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),

                // <==================== Join Task Manager Today Text  ====================>
                SizedBox(height: 8),
                CustomeText(
                  text: AppString.joinTaskManagerToday,
                  fontSize: 14,
                  color: AppColors.secondaryText,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.visible,
                ),

                // <==================== Fisrt Name Text Field  ====================>
                SizedBox(height: 23),
                Row(
                  children: [
                    CustomeText(
                      text: AppString.firstName,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 6),
                CustomeTextfield(
                  textfielController: firstNameController,
                  hintText: AppString.firstName,
                ),

                // <==================== Last Name Text Field  ====================>
                SizedBox(height: 23),
                Row(
                  children: [
                    CustomeText(
                      text: AppString.lastName + AppString.optional,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 6),
                CustomeTextfield(
                  textfielController: lastNameController,
                  hintText: AppString.lastName,
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

                // <==================== Adress Text Field  ====================>
                SizedBox(height: 23),
                Row(
                  children: [
                    CustomeText(
                      text: AppString.address + AppString.optional,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 6),
                CustomeTextfield(
                  textfielController: addressController,
                  hintText: AppString.address,
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

                // <==================== Confirm Password Text Field  ====================>
                SizedBox(height: 23),
                Row(
                  children: [
                    CustomeText(
                      text: AppString.confirmPassword,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 6),
                CustomeTextfield(
                  textfielController: confirmPwController,
                  hintText: AppString.confirmPassword,
                  isPassword: true,
                ),

                // <==================== I agree to the Terms & Conditions and Privacy Policy. ====================>
                Row(
                  children: [
                    CustomeCheckbox(
                      onChanged: (value) => toggle(),
                      value: agreeTearmAndCondition,
                    ),
                    CustomeText(
                      text: AppString.terms,
                      color: AppColors.grey700,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),

                // <==================== Divider  ====================>
                SizedBox(height: 23),
                CustomeDivider(text: AppString.or),

                // <==================== DAlready have an account? and login button  ====================>
                SizedBox(height: 23),
                Row(
                  children: [
                    CustomeText(
                      text: AppString.allreadyHaveAccount,
                      fontSize: 14,
                      color: AppColors.grey700,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login_screen");
                      },
                      child: CustomeText(
                        text: AppString.logIn,
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
                  return _signupController.isLoading.value == true
                      ? CircularProgressIndicator()
                      : CustomeButton(
                          buttonName: AppString.signUp,
                          onTap: () {
                            // <==================== Fill Requird Warning  ====================>
                            if (firstNameController.text.isEmpty ||
                                emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              Get.snackbar(
                                "Warning...",
                                "Please Fill All required  ",
                              );
                            } else {
                              // <==================== Password Doesnt Match Warning  ====================>
                              if (passwordController.text ==
                                  confirmPwController.text) {
                                // <==================== first name and last name join  ====================>
                                if (firstNameController.text.isNotEmpty) {
                                   String nameController =
                                      firstNameController.text +
                                      lastNameController.text;
                                  // <==================== Call signUp Function  ====================>
                                  _signupController.signUp(
                                    name: nameController,
                                    email: emailController.text,
                                    passWord: passwordController.text,
                                  );
                                } 
                              } else {
                                Get.snackbar(
                                  "Warning...",
                                  "Password Doesn/'t Match",
                                );
                              }
                            }
                          },
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager/utils/api/app_url.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';

class SignupController extends GetxService {
  var isLoading = false.obs;

  Future<void> signUp({
    required String name,
    required String email,
    required String passWord,
  }) async {
    try {
      isLoading(true);

      var map = <String, dynamic>{
        "name": name,
        "email": email,
        "password": passWord,
      };

      var respones = await http.post(
        Uri.parse(AppUrl.signUp),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(map),
      );

      if (respones.statusCode == 200) {
        var responseBody = jsonDecode(respones.body);
        //navigate to home
          Get.toNamed("/login_screen");
       if (responseBody['success'] == true) {



          Get.snackbar(
            backgroundColor: AppColors.brand,
            "Please Login",
            "SignUp Success",
          );
        } else {
          String errorMessage =
              responseBody['message'] ?? 'SignUp failed. Please try again.';

          if (responseBody['errorSources'] != null &&
              responseBody['errorSources'] is List) {
            List errorSources = responseBody['errorSources'];
            for (var error in errorSources) {
              if (error['message'] != null) {
                errorMessage = error['message'];
                break;
              }
            }
          }

          Get.snackbar(
            backgroundColor: AppColors.red500,
            "Warning", errorMessage);
        }
      } else {
       
      }
    } catch (e) {
      Get.snackbar(
        backgroundColor: AppColors.red500,
        "Error", "$e");
    } finally {
      isLoading(false);
    }
  }
}

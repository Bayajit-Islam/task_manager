import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager/utils/api/app_url.dart';
import 'package:task_manager/utils/api/local_storage.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';

class LoginController {
  var isLoading = false.obs;

  Future<void> login({required String email, required String password}) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{"email": email, "password": password};

      var respones = await http.post(
        Uri.parse(AppUrl.logIn),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(map),
      );

      if (respones.statusCode == 200) {
        var responseBody = jsonDecode(respones.body);

        if (responseBody['success'] == true) {
          Get.snackbar(
            backgroundColor: AppColors.brand,
            "Wellcome Back",
            "Login Success",
          );
          //accessToken
          String accessToken = responseBody["data"]["accessToken"];
          //getx storage
          final LocalStorage localStorage = Get.put(LocalStorage());
          localStorage.write("accessToken", accessToken);

          //navigate to home
          Get.offAllNamed("/navBar");
        } else {
          String errorMessage = 'Login failed. Please try again.';


          Get.snackbar(
            backgroundColor: AppColors.red500,
            "Warning",
            errorMessage,
          );
        }
      }else{
        Get.snackbar(
            backgroundColor: AppColors.red500,
            "Warning",
            "Username & Password Wrong...",
          );
      }
    } catch (e) {
      Get.snackbar(backgroundColor: AppColors.red500, "Error", "$e");
    } finally {
      isLoading(false);
    }
  }
}

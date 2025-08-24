import 'dart:convert';
import 'package:get/get.dart';
import 'package:task_manager/model/profile_model/profile_model.dart';
import 'package:task_manager/utils/api/app_url.dart';
import 'package:task_manager/utils/api/base_url.dart';

class ProfileUserController extends GetxService {
  var profile = UserProfile(name: "", email: "").obs;

  Future<void> getProfileData() async {
    final response = await BaseClient.getRequest(api: AppUrl.myPrfile);

    try {
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

         if (jsonData["data"] != null) {
          profile.value = UserProfile.fromJson(jsonData["data"]);
        }else{
            //now dont show anything
        }
      }
    } finally {

        //show data 
    }
  }
}

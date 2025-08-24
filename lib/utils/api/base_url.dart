import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager/utils/api/local_storage.dart';

class BaseClient {
  // <=========== Post Api ==========>
  static Future<http.Response> postRequest({
    required String api,
    required Map<String, dynamic> body,
  }) async {
    //get x storage
    final LocalStorage localStorage = Get.put(LocalStorage());
    String? accessToken = localStorage.read("accessToken");

    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    var jsonBody = jsonEncode(body);
    try {
      http.Response response = await http.post(
        Uri.parse(api),
        headers: headers,
        body: jsonBody,
      );

      return response;
    } catch (e) {
      throw "Erroe: $e";
    }
  }

  // <=========== Get Api ==========>
  static Future<http.Response> getRequest({required String api, params}) async {
    //get x storage
    final LocalStorage localStorage = Get.put(LocalStorage());
    String? accessToken = localStorage.read("accessToken");

    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
    };

    http.Response response = await http.get(Uri.parse(api), headers: headers);
    return response;
  }
}

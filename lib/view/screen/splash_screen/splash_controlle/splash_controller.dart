// ignore_for_file: await_only_futures

import 'dart:async';
import 'package:get/get.dart';
import 'package:task_manager/utils/api/local_storage.dart';

class SplashController extends GetxService {
  Timer? timer;
  var opacity = 0.0.obs;
  //get x storeage
  final LocalStorage _localStorage = Get.put(LocalStorage());

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      if (opacity.value != 1.0) {
        opacity.value += 0.5;
      }
    });

    Future.delayed(const Duration(seconds: 3), () async {
      String? accessToke = await _localStorage.read("accessToken");
      if (accessToke != null && accessToke.isNotEmpty) {
        Get.offAllNamed("/navBar");
      } else {
        Get.offAllNamed("/login_screen");
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
    
  }
}

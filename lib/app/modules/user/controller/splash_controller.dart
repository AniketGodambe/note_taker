import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:note_taker/utils/app_preferences.dart';

import '../../../../routes.dart';
import '../models/user_details.dart';

class SplashController extends GetxController {
  RxBool isLoading = false.obs;
  checkUserCreds({fromSreen}) async {
    isLoading.value = true;

    String? userName = await AppPreferences.getUserName();

    if (userName != null) {
      UserDetails? data = await AppPreferences.getUserByUsername(userName);
      Future.delayed(const Duration(seconds: 2), () {
        isLoading.value = false;
        log(jsonEncode(data));
        if (data != null) {
          if (data.username != null || data.password != null) {
            Get.offAllNamed(Routes.homeView);
          } else {
            if (fromSreen == "splash") {
              Get.offAllNamed(Routes.loginView);
            } else {
              Get.snackbar("Error", "Incorect Credentials");
            }
          }
        } else {
          Get.offAllNamed(Routes.signupView);
        }
      });
    } else {
      Get.offAllNamed(Routes.signupView);
    }
  }

  @override
  void onInit() {
    checkUserCreds(fromSreen: "splash");
    super.onInit();
  }
}

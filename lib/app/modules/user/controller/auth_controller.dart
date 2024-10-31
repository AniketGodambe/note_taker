import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taker/utils/app_preferences.dart';

import '../../../../routes.dart';
import '../models/user_details.dart';

class AuthController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();

  Rx<TextEditingController> firstNameController = Rx(TextEditingController());
  Rx<TextEditingController> lastNameController = Rx(TextEditingController());
  Rx<TextEditingController> mobileController = Rx(TextEditingController());
  Rx<TextEditingController> emailController = Rx(TextEditingController());
  Rx<TextEditingController> usernameController = Rx(TextEditingController());

  Rx<TextEditingController> passwordController = Rx(TextEditingController());

  var userDetails = UserDetails().obs;

  checkUserCreds({fromSreen}) async {
    List<UserDetails>? dataList = await AppPreferences.getAllUsers();

    if (dataList != null) {
      if (dataList.any((user) =>
          user.username == usernameController.value.text &&
          user.password == passwordController.value.text)) {
        AppPreferences.setUserName(usernameController.value.text);
        Get.offAllNamed(Routes.homeView);
      } else {
        if (fromSreen == "splash") {
          Get.offAllNamed(Routes.loginView);
        } else {
          Get.snackbar("Error", "Incorect Credentials");
        }
      }
    } else {
      Get.snackbar("Error", "User dons't exitst!");
    }
  }
}

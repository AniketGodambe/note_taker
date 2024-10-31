import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taker/app/modules/user/controller/auth_controller.dart';
import 'package:note_taker/app/modules/user/models/user_details.dart';

import '../../../../routes.dart';
import '../../../../utils/app_preferences.dart';

class HomeViewController extends GetxController {
  RxBool isLoading = false.obs;
  var userDetails = UserDetails().obs;
  var authViewdata = Get.find<AuthController>();

  Rx<TextEditingController> titleCTR = Rx(TextEditingController());
  Rx<TextEditingController> priorityCTR =
      Rx(TextEditingController(text: "Medium"));
  Rx<TextEditingController> detailsCTR = Rx(TextEditingController());

  List<DropdownMenuItem<String>> priorityTypes = [
    DropdownMenuItem(value: "High", child: Text("High".capitalizeFirst!)),
    DropdownMenuItem(value: "Medium", child: Text("Medium".capitalizeFirst!)),
    DropdownMenuItem(value: "Low", child: Text("Low".capitalizeFirst!)),
  ];

  final addeditNotesFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

  getUserDetails() async {
    String? userName = await AppPreferences.getUserName();
    if (userName != null) {
      UserDetails? data = await AppPreferences.getUserByUsername(userName);
      isLoading.value = false;
      userDetails.value = data!;
    } else {
      Get.offAllNamed(Routes.signupView);
    }
  }
}

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taker/app/modules/user/controller/auth_controller.dart';
import 'package:note_taker/app/modules/user/models/user_details.dart';

import '../../../../routes.dart';
import '../../../../utils/app_preferences.dart';
import '../models/user_notes_list/user_notes_list.dart';

class HomeViewController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool addEditNote = false.obs;

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

  RxList<NotesList> getAllNotes = <NotesList>[].obs;

  @override
  void onInit() {
    getUserDetails();
    getAllNotesFn();

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

  getAllNotesFn() async {
    addEditNote.value = true;
    List<NotesList>? data = await AppPreferences.getAllNotes();

    if (data != null) {
      getAllNotes.value = data;
    } else {
      getAllNotes.value = [];
    }
    print(jsonEncode(getAllNotes));
    addEditNote.value = false;
  }

  int generateRandomId() {
    final random = Random();
    return random.nextInt(1000000); // Adjust the max value as needed
  }

  var data = [
    {
      "userName": "aniketgodambe",
      "data": [
        {
          "id": 474976,
          "title": "My Title",
          "userName": "aniketgodambe",
          "priority": "Medium",
          "details": "New Notes has been added",
          "updatedAt": "2024-11-05 18:43:12.083043"
        },
        {
          "id": 61487,
          "title": "New Note ",
          "userName": "aniketgodambe",
          "priority": "Medium",
          "details": "My Notes has been added",
          "updatedAt": "2024-11-05 18:45:36.121122"
        }
      ]
    },
    {
      "userName": "pratik",
      "data": [
        {
          "id": 808723,
          "title": "Why New",
          "userName": "aniketgodambe",
          "priority": "Medium",
          "details": "Always help to get ideas on it",
          "updatedAt": "2024-11-05 18:47:01.226501"
        },
        {
          "id": 176647,
          "title": "Always Helps",
          "userName": "aniketgodambe",
          "priority": "Low",
          "details": "New Data add hua hai ",
          "updatedAt": "2024-11-05 18:47:51.217999"
        }
      ]
    }
  ];
}

// import 'dart:convert';

import 'dart:convert';

import 'package:get/get.dart';
import 'package:note_taker/app/modules/user/models/user_details.dart';
import 'package:note_taker/routes.dart';
import 'package:note_taker/utils/custom_widgets/colors_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static Future addUser(UserDetails newUser) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<UserDetails> users = await getAllUsers() ?? [];

    // Check if the user already exists based on a unique identifier (e.g., email or username)
    try {
      bool userExists = users.any((user) =>
          user.username == newUser.username ||
          user.email == newUser.email ||
          user.mobile == newUser.mobile);

      if (userExists) {
        Get.snackbar(
          "Error",
          "User Already exists!",
          colorText: whiteColor,
          backgroundColor: redColor.withOpacity(0.7),
        );
        throw Exception(
          "User with the same username or email already exists.",
        );
      }
      setUserName(newUser.username!);
      users.add(newUser);
      String usersJson =
          jsonEncode(users.map((user) => user.toJson()).toList());
      await prefs.setString(PreferenceKeys.userDetails, usersJson);
      Get.offAllNamed(Routes.homeView);
    } catch (e) {
      print(e);
    }
  }

  static Future<List<UserDetails>?> getAllUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usersJson = prefs.getString(PreferenceKeys.userDetails);
    if (usersJson != null) {
      List<dynamic> userMaps = jsonDecode(usersJson);
      return userMaps.map((userMap) => UserDetails.fromJson(userMap)).toList();
    } else {
      return null;
    }
  }

  static Future<UserDetails?> getUserByUsername(String username) async {
    List<UserDetails>? users = await getAllUsers();
    return users?.firstWhere((user) => user.username == username,
        orElse: () => UserDetails());
  }

  static Future<void> setUserName(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(PreferenceKeys.userName, value);
  }

  static Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(PreferenceKeys.userName)) {
      return prefs.getString(PreferenceKeys.userName);
    }
    return null;
  }

  // static Future<void> setRemiderStatus(String value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(PreferenceKeys.isreminderSeen, value);
  // }

  // static Future<String?> getReminderStauts() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.containsKey(PreferenceKeys.isreminderSeen)) {
  //     return prefs.getString(PreferenceKeys.isreminderSeen);
  //   }
  //   return null;
  // }

  // static Future<void> setQuizStatus(String value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(PreferenceKeys.quizStatus, value);
  // }

  // static Future<String?> getQuizStatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.containsKey(PreferenceKeys.quizStatus)) {
  //     return prefs.getString(PreferenceKeys.quizStatus);
  //   }
  //   return null;
  // }

  // static Future<void> setRegisterData(UserDetails value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String userJson = jsonEncode(value.toJson());
  //   await prefs.setString(PreferenceKeys.userDetails, userJson);
  // }

  // static Future<UserDetails?> getRegisterData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userJson = prefs.getString(PreferenceKeys.userDetails);
  //   if (userJson != null) {
  //     Map<String, dynamic> userMap = jsonDecode(userJson);
  //     return UserDetails.fromJson(userMap);
  //   } else {
  //     return null;
  //   }
  // }

  // static Future<void> isNewUser(String value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(PreferenceKeys.newUser, value);
  // }

  // static Future<String?> getNewUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.containsKey(PreferenceKeys.newUser)) {
  //     return prefs.getString(PreferenceKeys.newUser);
  //   }
  //   return null;
  // }

  static Future<void> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

class PreferenceKeys {
  static String userName = "";
  static String isreminderSeen = "";
  static String quizStatus = "";
  static String userDetails = "userDetails";
}

var data = {
  "username": "aniketgodambe",
  "password": "aniket123",
  "firstname": "Aniket",
  "lastname": "Godambe",
  "mobile": 9260361427,
  "email": "aniket@gmail.com"
};

// import 'dart:convert';

import 'dart:convert';

import 'package:get/get.dart';
import 'package:note_taker/app/modules/user/models/user_details.dart';
import 'package:note_taker/routes.dart';
import 'package:note_taker/utils/custom_widgets/colors_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/modules/home/models/user_notes_list/user_notes_list.dart';

class AppPreferences {
  static Future addUser(UserDetails newUser) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<UserDetails> users = await getAllUsers() ?? [];

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

  static Future addNote(NotesList newNote) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<NotesList> users = await getAllNotes() ?? [];

    try {
      users.add(newNote);
      String usersJson =
          jsonEncode(users.map((user) => user.toJson()).toList());
      await prefs.setString(PreferenceKeys.usernotes, usersJson);

      Get.back();
    } catch (e) {
      print(e);
    }
  }

  static Future<List<NotesList>?> getAllNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userNotes = prefs.getString(PreferenceKeys.usernotes);
    if (userNotes != null) {
      List<dynamic> userMaps = jsonDecode(userNotes);
      return userMaps.map((userMap) => NotesList.fromJson(userMap)).toList();
    } else {
      return null;
    }
  }

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
  static String usernotes = "userNotes";
}

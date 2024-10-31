import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taker/app/modules/user/controller/auth_controller.dart';
import 'package:note_taker/routes.dart';
import 'package:note_taker/utils/custom_widgets/gaps.dart';
import 'package:note_taker/utils/custom_widgets/primary_buttons.dart';

import '../../../../utils/app_preferences.dart';
import '../../../../utils/custom_widgets/custom_text_style.dart';
import '../../../../utils/custom_widgets/custom_textfield_widget.dart';

class SignUpView extends GetView<AuthController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
        child: PrimaryButton(
          onTap: () {
            if (controller.signupFormKey.currentState!.validate()) {
              AppPreferences.addUser(controller.userDetails.value);
            }
          },
          title: 'SignUp',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.signupFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gaps.kheight40,
              const Text(
                "Sign up",
                style: filterAppbarStyle,
              ),
              const Text(
                "Fill you details",
                style: previewHeadingStyle,
              ),
              Gaps.kheight20,
              CustomInputField(
                controller: controller.firstNameController.value,
                title: 'First Name',
                textInputType: TextInputType.name,
                hintText: "Please enter your first name",
                maxLength: 20,
                onChanged: (value) {
                  controller.userDetails.value.firstname = value;
                },
              ),
              Gaps.kheight10,
              CustomInputField(
                controller: controller.lastNameController.value,
                title: 'Last Name',
                textInputType: TextInputType.name,
                hintText: "Please enter your last name",
                maxLength: 20,
                onChanged: (value) {
                  controller.userDetails.value.lastname = value;
                },
              ),
              Gaps.kheight10,
              CustomInputField(
                controller: controller.mobileController.value,
                title: 'Mobile',
                textInputType: TextInputType.number,
                hintText: "Please enter your mobile number",
                maxLength: 10,
                onChanged: (value) {
                  controller.userDetails.value.mobile =
                      int.parse(value.toString());
                },
                validator: (val) {
                  if (val!.isEmpty || val.length < 10) {
                    return "Please enter corect mobile number!";
                  }
                  return null;
                },
              ),
              Gaps.kheight10,
              CustomInputField(
                controller: controller.emailController.value,
                title: 'Email',
                textInputType: TextInputType.emailAddress,
                hintText: "Please enter your email",
                onChanged: (value) {
                  controller.userDetails.value.email = value;
                },
                validator: (val) {
                  if (val!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val)) {
                    return "please enter valid email";
                  }
                  return null;
                },
              ),
              Gaps.kheight10,
              CustomInputField(
                controller: controller.usernameController.value,
                title: 'Username',
                textInputType: TextInputType.name,
                hintText: "Please enter your username",
                onChanged: (value) {
                  controller.userDetails.value.username = value;
                },
                validator: (val) {
                  if (val!.isEmpty || !RegExp(r'^[a-z0-9_]+$').hasMatch(val)) {
                    return "please enter valid email";
                  }
                  return null;
                },
              ),
              Gaps.kheight10,
              CustomInputField(
                controller: controller.passwordController.value,
                title: 'Password',
                textInputType: TextInputType.visiblePassword,
                hintText: "Please enter your password",
                maxLength: 8,
                onChanged: (value) {
                  controller.userDetails.value.password = value;
                },
                validator: (val) {
                  if (val!.isEmpty || val.length < 8) {
                    return "Please check password!";
                  }
                  return null;
                },
              ),
              Gaps.kheight20,
              GestureDetector(
                onTap: () {
                  Get.offAllNamed(Routes.loginView);
                },
                child: const Text(
                  "Already have account? Login up",
                  style: previewHeadingStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

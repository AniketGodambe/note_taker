import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taker/app/modules/user/controller/auth_controller.dart';
import 'package:note_taker/routes.dart';
import 'package:note_taker/utils/custom_widgets/gaps.dart';
import 'package:note_taker/utils/custom_widgets/primary_buttons.dart';

import '../../../../utils/custom_widgets/custom_text_style.dart';
import '../../../../utils/custom_widgets/custom_textfield_widget.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
        child: PrimaryButton(
          onTap: () {
            if (controller.loginFormKey.currentState!.validate()) {
              controller.checkUserCreds();
            }
          },
          title: 'Login',
        ),
      ),
      body: Form(
        key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Please Login",
                style: headingStyle,
              ),
              const Text(
                "Using your username and password",
                style: subheadingStyle,
              ),
              Gaps.kheight30,
              CustomInputField(
                controller: controller.usernameController.value,
                title: 'Username',
                textInputType: TextInputType.streetAddress,
                hintText: "Please enter your username",
                validator: (val) {
                  if (val!.isEmpty || !RegExp(r'^[a-z0-9_]+$').hasMatch(val)) {
                    return "please enter valid email";
                  }
                  return null;
                },
              ),
              Gaps.kheight20,
              CustomInputField(
                controller: controller.passwordController.value,
                title: 'Password',
                textInputType: TextInputType.visiblePassword,
                hintText: "Please enter your password",
                maxLength: 8,
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
                  Get.offAllNamed(Routes.signupView);
                },
                child: const Text(
                  "Don't have account? Sign up",
                  style: subheadingStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

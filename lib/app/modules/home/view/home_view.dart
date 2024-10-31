import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taker/app/modules/home/controller/home_view_controller.dart';
import 'package:note_taker/routes.dart';
import 'package:note_taker/utils/custom_widgets/colors_const.dart';
import 'package:note_taker/utils/custom_widgets/custom_text_style.dart';
import 'package:note_taker/utils/custom_widgets/gaps.dart';
import 'package:note_taker/utils/custom_widgets/primary_buttons.dart';

class HomeView extends GetView<HomeViewController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Welcome, ${controller.userDetails.value.firstname ?? ""}",
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.offNamed(Routes.loginView);
              },
              icon: const Icon(
                Icons.logout_rounded,
                color: whiteColor,
                size: 30,
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          return controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    userDetailsCard(),
                    Gaps.kheight40,
                    PrimaryButton(
                      onTap: () {
                        Get.toNamed(Routes.addEditNotes);
                      },
                      title: "Add Note",
                    )
                  ],
                );
        }),
      ),
    );
  }

  Container userDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${controller.userDetails.value.firstname ?? ""}  ${controller.userDetails.value.lastname ?? ""}  ",
            style: headingBlackstyle,
          ),
          Gaps.kheight5,
          Text(
            "+91${controller.userDetails.value.mobile ?? ""}",
            style: headingBlackstyle,
          ),
          Gaps.kheight5,
          Text(
            controller.userDetails.value.email ?? "",
            style: headingBlackstyle,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taker/app/modules/home/controller/home_view_controller.dart';

import '../../../../routes.dart';

class HomeView extends GetView<HomeViewController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Obx(() {
          return controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Text(controller.userDetails.value.firstname ?? "-"),
                    IconButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.loginView);
                        },
                        icon: const Icon(Icons.login)),
                  ],
                );
        }),
      ),
    );
  }
}

import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
      SplashController(),
    );
    Get.put<AuthController>(
      AuthController(),
    );
  }
}

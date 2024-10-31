import 'package:get/get.dart';
import 'package:note_taker/app/modules/user/controller/splash_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}

import 'package:get/get.dart';

import '../controller/home_view_controller.dart';

class HomeViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewController>(
      () => HomeViewController(),
    );
  }
}

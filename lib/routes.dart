import 'package:get/get.dart';
import 'package:note_taker/app/modules/home/view/home_view.dart';
import 'package:note_taker/app/modules/user/view/login_view.dart';

import 'app/modules/home/bindings/home_view_bindings.dart';
import 'app/modules/home/view/add_edit_notes_view.dart';
import 'app/modules/user/bindings/auth_bindings.dart';
import 'app/modules/user/bindings/spalsh_bindings.dart';
import 'app/modules/user/view/sign_up_view.dart';
import 'app/modules/user/view/splash_view.dart';

class Routes {
  static String splashView = "/splash";
  static String loginView = "/login";
  static String signupView = "/signup";
  static String homeView = "/home";
  static String addEditNotes = "/addEditNotes";
}

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.splashView,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.loginView,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signupView,
      page: () => const SignUpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.homeView,
      page: () => const HomeView(),
      binding: HomeViewBindings(),
    ),
    GetPage(
      name: Routes.addEditNotes,
      page: () => const AddEditNotesView(),
    ),
  ];
}

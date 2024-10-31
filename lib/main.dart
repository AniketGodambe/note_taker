import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:note_taker/base_binding.dart';
import 'package:note_taker/routes.dart';

import 'utils/custom_widgets/colors_const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Note Taker',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: backgroundColor),
          useMaterial3: true,
          scaffoldBackgroundColor: blackColor,
          appBarTheme: const AppBarTheme(
              backgroundColor: blackColor,
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.24,
              ),
              iconTheme: IconThemeData(
                color: whiteColor,
              )),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashView,
        getPages: AppPages.routes,
        initialBinding: BaseBinding());
  }
}

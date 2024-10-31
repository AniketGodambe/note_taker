import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:note_taker/base_binding.dart';
import 'package:note_taker/routes.dart';
import 'app/modules/user/view/login_view.dart';

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashView,
        getPages: AppPages.routes,
        initialBinding: BaseBinding());
  }
}

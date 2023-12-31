import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rentitezy/utils/const/app_urls.dart';
import 'screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
  GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppUrls.appName,
     // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const ForgotScreen(),
      home: const SplashScreenPage(),
      //home: const ProfileScreenNew(),
    );
  }
}

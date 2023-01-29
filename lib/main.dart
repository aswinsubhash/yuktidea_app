import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yuktidea_ui/app/modules/splash/bindings/splash_binding.dart';
import 'package:yuktidea_ui/app/routes/app_pages.dart';
import 'package:yuktidea_ui/app/services/api_services.dart';

void main() {
final api =  APIServices();
  runApp(
    GetMaterialApp(
      title: "Cinecompass",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}

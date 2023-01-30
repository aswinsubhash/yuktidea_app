import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yuktidea_ui/app/routes/app_pages.dart';
import 'package:yuktidea_ui/app/services/dio_client.dart';

void main() {
  DioClient();
  runApp(
    GetMaterialApp(
      title: "Cinecompass",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}

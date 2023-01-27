import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yuktidea_ui/app/routes/app_pages.dart';




void main() {
  runApp(
    GetMaterialApp(
      title: "Cinecompass",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat'
      ),
    ),
  );
}
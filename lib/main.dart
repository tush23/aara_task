import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/api/provider/api_provider.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  Get.put<ApiProvider>(
    ApiProvider(),
  );
  // Get.put(HomeController());

  runZonedGuarded<Future<void>>(
    () async {
      runApp(
        GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Aara Task App",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
      );
    },
    (dynamic error, StackTrace stackTrace) {
      print('<<----------ERROR--------->> \n$error $stackTrace');
      Get.defaultDialog(
          title: 'Error', middleText: '$error', barrierDismissible: true);
    },
  );
}

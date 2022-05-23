import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yast/utils/binding.dart';
import 'package:yast/utils/routes.dart';
import 'package:yast/utils/theme.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    theme: appThemeData,
    defaultTransition: Transition.fade,
    initialBinding: MyPageBinding(),
    getPages: AppPages.pages,
  ));
}

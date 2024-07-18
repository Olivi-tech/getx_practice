import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_practice/home_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_practice/app_translations.dart';
import 'package:getx_practice/app_routes.dart';

void main() async {
  await GetStorage.init();
  runApp(GetxPractice());
}

class GetxPractice extends StatelessWidget {
  GetxPractice({super.key});

  final box = GetStorage();
  final ThemeData lightTheme = ThemeData.light();
  final ThemeData darkTheme = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    log('${box.read('isDarkMode')}');
    final themeValue = box.read('isDarkMode') ?? false;
    return GetMaterialApp(
      theme: themeValue ? darkTheme : lightTheme,
      home: HomeScreen(),
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      getPages: AppRoutes.getRoutes(),
    );
  }
}

import 'package:blogbreeze/pages/splashscreen_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'controllers/app_controller.dart';

import 'services/bindings.dart';
import 'themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    Get.put(AppController());
initializeDateFormatting('en_US',);

  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BlogBreeze',
         locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', 'US'),
        initialBinding: AppBindings(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!);
        },
           theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
        home:SplashscreenPage()),
  );
}
















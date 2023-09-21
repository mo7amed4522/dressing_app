import 'dart:io';

import 'package:dressing_app/controller/binding/initial_bindings.dart';
import 'package:dressing_app/core/routes/routes.dart';
import 'package:dressing_app/core/server/serves.dart';
import 'package:dressing_app/core/theme/theme_color.dart';
import 'package:dressing_app/core/translation/my_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

MyServices myServices = Get.find();
void initialize() {
  if (myServices.sharedPreferences.getBool('theme') == true) {
    Get.changeThemeMode(ThemeMode.dark);
  } else if (myServices.sharedPreferences.getBool('theme') == false) {
    Get.changeThemeMode(ThemeMode.light);
  } else {
    Get.changeThemeMode(ThemeMode.system);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, devicetype) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        onInit: initialize,
        translations: MyTranslation(),
        theme: AppColor.customLightThem,
        locale: const Locale('ar'),
        darkTheme: AppColor.customDarkThem,
        themeMode: ThemeMode.system,
        title: 'Dressing'.tr,
        initialBinding: InitialBindings(),
        getPages: routes,
      ),
    );
  }
}

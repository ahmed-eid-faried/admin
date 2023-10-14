import 'package:adminapp/binding/bindings.dart';
import 'package:adminapp/core/constant/apptheme.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/localization/locale.dart';
import 'package:adminapp/core/localization/translation.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
void main() async {
  // ErrorWidget.builder = (FlutterErrorDetails details) => Container();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initService();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      locale: controller.lang,
      title: 'E-commrce', 
      theme: AppThemes.stdTheme,
      initialRoute: AppRoute.lang,
      getPages: routes,
      initialBinding: MyBindings(),
    );
  }
}

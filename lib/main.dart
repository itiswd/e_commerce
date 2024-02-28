import 'package:e_commerce/binding/initial_binding.dart';
import 'package:e_commerce/core/localization/changelocal.dart';
import 'package:e_commerce/core/localization/translation.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences mainprefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  mainprefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends GetView<LocaleController> {
  const MyApp({super.key});
  //This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'First Ecommerce',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}

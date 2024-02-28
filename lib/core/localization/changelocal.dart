import 'package:e_commerce/core/constant/app_theme.dart';
import 'package:e_commerce/core/functions/fcm.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language = const Locale('en');
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  changeLang(String langCode) async {
    Locale locale = Locale(langCode);
    await myServices.sharedPreferences.setString('lang', langCode);
    appTheme = langCode == 'ar' ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
    update();
  }

  requestLocationPermision() async {
    bool servicesEnabled;
    LocationPermission permission;
    servicesEnabled = await Geolocator.isLocationServiceEnabled();
    if (!servicesEnabled) {
      Get.defaultDialog(
        title: '47'.tr,
        content: Text(
          '166'.tr,
        ),
      );
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.defaultDialog(
          title: '47'.tr,
          content: Text(
            '166'.tr,
          ),
        );
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.defaultDialog(
        title: '47'.tr,
        content: Text(
          '166'.tr,
        ),
      );
    }
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    requestLocationPermision();
    String? sharedPrefLang = myServices.sharedPreferences.getString('lang');
    if (sharedPrefLang == 'ar') {
      language = const Locale('ar');
      appTheme = themeArabic;
    } else if (sharedPrefLang == 'en') {
      language = const Locale('en');
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}

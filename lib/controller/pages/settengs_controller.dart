import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SettingsController extends GetxController {
  logOut();
  contactUs(dynamic linkk, dynamic x);
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();
  @override
  logOut() {
    String id = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("user$id");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  Future<void> contactUs(dynamic linkk, dynamic x) async {
    if (!await launchUrl(
      Uri.parse(linkk),
      mode: x,
    )) {
      throw '${'165'.tr} ${Uri.parse(linkk)}';
    }
  }
}

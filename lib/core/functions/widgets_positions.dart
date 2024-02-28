import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

bool widgetsPositions() {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return true;
  } else {
    return false;
  }
}

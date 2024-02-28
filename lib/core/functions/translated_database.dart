import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

translatedDatabase(ar, en) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return ar;
  } else {
    return en;
  }
}

import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == '138'.tr) {
    if (!GetUtils.isUsername(val)) {
      return '139'.tr;
    }
  }
  if (type == '140'.tr) {
    if (!GetUtils.isEmail(val)) {
      return '141'.tr;
    }
  }
  if (type == '142'.tr) {
    if (!GetUtils.isPhoneNumber(val)) {
      return '143'.tr;
    }
  }
  if (val.isEmpty) {
    return '144'.tr;
  }
  if (val.length < min) {
    return '${'145'.tr} $min';
  }
  if (val.length > max) {
    return '${'146'.tr} $max';
  }
}

import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/forget password/reset_password.dart';

abstract class ResetPasswordController extends GetxController {
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  late TextEditingController password;
  late TextEditingController rePassword;
  bool isShowPassword1 = true;
  bool isShowPassword2 = true;
  String? email;
  StatusRequest? statusRequest;

  @override
  goToSuccessResetPassword() async {
    if (password.text != rePassword.text) {
      return Get.defaultDialog(title: '147'.tr, middleText: '153'.tr);
    }
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(
        email!,
        password.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.successResetPassword);
        } else {
          Get.defaultDialog(title: '147'.tr, middleText: '154'.tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      return '149'.tr;
    }
  }

  showPassword1() {
    isShowPassword1 = isShowPassword1 == true ? false : true;
    update();
  }

  showPassword2() {
    isShowPassword2 = isShowPassword2 == true ? false : true;
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}

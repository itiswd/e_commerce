import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/data/datasource/remote/auth/verifycoce_signup.dart';
import 'package:get/get.dart';

import '../../core/functions/handling_data_controller.dart';

abstract class VerifyCodeSignUpCotroller extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifyCodeSignUp);
  resendVer();
}

class VerifyCodeSignUpCotrollerImp extends VerifyCodeSignUpCotroller {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verifyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(
      email!,
      verifyCodeSignUp,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.successSignUp);
      } else {
        Get.defaultDialog(title: '147'.tr, middleText: '151'.tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  resendVer() {
    verifyCodeSignUpData.resendVerifyCode(email!);
  }
}

import 'package:e_commerce/data/datasource/remote/forget%20password/verifycode.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data_controller.dart';

abstract class VerifyCodeCotroller extends GetxController {
  goToSuccessResetPassword(String verifyCode);
}

class VerifyCodeCotrollerImp extends VerifyCodeCotroller {
  String? email;

  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());

  StatusRequest? statusRequest;

  @override
  goToSuccessResetPassword(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeForgetPasswordData.postData(email!, verifyCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(title: '147'.tr, middleText: '151'.tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}

import 'package:e_commerce/controller/auth/success_signup_controller.dart';
import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        title: Text(
          "32".tr,
          style: Get.textTheme.headlineMedium!.copyWith(
            color: AppColor.greyDark,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: Get.width / 3),
          const Center(
            child: Icon(
              Icons.check_circle_outlined,
              size: 160,
              color: AppColor.primaryColor,
            ),
          ),
          SizedBox(height: Get.width / 16),
          Text(
            "36".tr,
            textAlign: TextAlign.center,
            style: Get.textTheme.displayLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SizedBox(
              width: Get.width - 48,
              child: CustomButtonAuth(
                text: "31".tr,
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

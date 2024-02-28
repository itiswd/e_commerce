import 'package:e_commerce/controller/forget%20password/reset_password_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custombodytext.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtexttitle.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        title: Text(
          "42".tr,
          style: Get.textTheme.headlineMedium!.copyWith(
            color: AppColor.greyDark,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              SizedBox(height: Get.width / 32),
              CustomTitleAuth(
                title: "35".tr,
              ),
              SizedBox(height: Get.width / 56),
              CustomTextBodyAuth(
                text: "34".tr,
              ),
              SizedBox(height: Get.width / 12),
              //password
              GetBuilder<ResetPasswordControllerImp>(
                builder: (controller) => CustomTextFormAuth(
                  onTapIcon: () {
                    controller.showPassword1();
                  },
                  obSecureText: controller.isShowPassword1,
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 30, 'password');
                  },
                  hintText: "13".tr,
                  lableText: "19".tr,
                  iconData: controller.isShowPassword1 == true
                      ? Icons.visibility_off
                      : Icons.visibility,
                  myController: controller.password,
                ),
              ),
              SizedBox(height: Get.width / 16),
              //re password
              GetBuilder<ResetPasswordControllerImp>(
                builder: (controller) => CustomTextFormAuth(
                  onTapIcon: () {
                    controller.showPassword2();
                  },
                  obSecureText: controller.isShowPassword2,
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 30, 'password');
                  },
                  hintText: "43".tr,
                  lableText: "19".tr,
                  iconData: controller.isShowPassword2 == true
                      ? Icons.visibility_off
                      : Icons.visibility,
                  myController: controller.rePassword,
                ),
              ),
              SizedBox(height: Get.width / 24),
              CustomButtonAuth(
                text: "33".tr,
                onPressed: () {
                  controller.goToSuccessResetPassword();
                },
              ),
              SizedBox(height: Get.width / 6),
            ],
          ),
        ),
      ),
    );
  }
}

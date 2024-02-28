import 'package:e_commerce/controller/auth/login_controller.dart';
import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/valid_input.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce/view/widget/auth/textchooseauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/alert_exit_app.dart';
import '../../widget/auth/custombodytext.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtexttitle.dart';
import '../../widget/auth/logoauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        surfaceTintColor: AppColor.backgroundColor,
        backgroundColor: AppColor.backgroundColor,
        title: Text(
          "9".tr,
          style: Get.textTheme.headlineMedium!.copyWith(
            color: AppColor.greyDark,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  right: 24,
                  left: 24,
                ),
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      SizedBox(height: Get.width / 8),
                      const LogoAuth(),
                      SizedBox(height: Get.width / 48),
                      CustomTitleAuth(
                        title: "10".tr,
                      ),
                      SizedBox(height: Get.width / 48),
                      CustomTextBodyAuth(
                        text: "11".tr,
                      ),
                      SizedBox(height: Get.width / 12),
                      //email
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 5, 100, 'email');
                        },
                        hintText: "12".tr,
                        lableText: "18".tr,
                        iconData: Icons.email_outlined,
                        myController: controller.email,
                      ),
                      SizedBox(height: Get.width / 16),
                      //password
                      GetBuilder<LoginControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          obSecureText: controller.isShowPassword,
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 30, 'password');
                          },
                          hintText: "13".tr,
                          lableText: "19".tr,
                          iconData: controller.isShowPassword == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          myController: controller.password,
                        ),
                      ),
                      SizedBox(height: Get.width / 24),
                      //forget password
                      GestureDetector(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "14".tr,
                          textAlign: TextAlign.end,
                          style: Get.textTheme.bodyMedium!.copyWith(
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: Get.width / 16),
                      //sign in button
                      CustomButtonAuth(
                        text: "15".tr,
                        onPressed: () {
                          controller.login();
                        },
                      ),
                      SizedBox(height: Get.width / 8),
                      //sign up
                      CustomChooseAuth(
                        text01: "16".tr,
                        text02: "17".tr,
                        onTap: () {
                          controller.goToSignUp();
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

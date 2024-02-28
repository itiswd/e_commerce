import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/valid_input.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/sign_up_controller.dart';
import '../../../core/functions/alert_exit_app.dart';
import '../../widget/auth/custombodytext.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtexttitle.dart';
import '../../widget/auth/textchooseauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          surfaceTintColor: AppColor.backgroundColor,
          backgroundColor: AppColor.backgroundColor,
          title: Text(
            "17".tr,
            style: Get.textTheme.displayLarge!.copyWith(
              color: AppColor.greyDark,
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
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
                          SizedBox(height: Get.width / 16),
                          CustomTitleAuth(
                            title: "41".tr,
                          ),
                          SizedBox(height: Get.width / 16),
                          CustomTextBodyAuth(
                            text: "24".tr,
                          ),
                          SizedBox(height: Get.width / 8),
                          //username
                          CustomTextFormAuth(
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 5, 16, 'username');
                            },
                            hintText: "23".tr,
                            lableText: "20".tr,
                            iconData: Icons.person_2_outlined,
                            myController: controller.username,
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
                          SizedBox(height: Get.width / 12),
                          //phone
                          CustomTextFormAuth(
                            isNumber: true,
                            valid: (val) {
                              return validInput(val!, 6, 20, 'phone');
                            },
                            hintText: "22".tr,
                            lableText: "21".tr,
                            iconData: Icons.phone_android_outlined,
                            myController: controller.phone,
                          ),
                          SizedBox(height: Get.width / 12),
                          //password
                          CustomTextFormAuth(
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
                          SizedBox(height: Get.width / 12),
                          CustomButtonAuth(
                            text: "17".tr,
                            onPressed: () {
                              controller.signUp();
                            },
                          ),
                          SizedBox(height: Get.width / 8),
                          CustomChooseAuth(
                            text01: "25".tr,
                            text02: "9".tr,
                            onTap: () {
                              controller.goToLogin();
                            },
                          ),
                          SizedBox(height: Get.width / 6),
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ));
  }
}

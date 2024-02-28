import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/forget password/forget_password_controller.dart';
import '../../../core/class/handlingdata.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custombodytext.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtexttitle.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.backgroundColor,
          title: Text(
            "14".tr,
            style: Get.textTheme.displayLarge!.copyWith(
              color: AppColor.greyDark,
            ),
          ),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Padding(
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
                        title: "27".tr,
                      ),
                      SizedBox(height: Get.width / 32),
                      CustomTextBodyAuth(
                        text: "29".tr,
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
                      SizedBox(height: Get.width / 24),
                      CustomButtonAuth(
                        text: "30".tr,
                        onPressed: () {
                          controller.checkEmail();
                        },
                      ),
                      SizedBox(height: Get.width / 6),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

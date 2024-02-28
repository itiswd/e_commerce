import 'package:e_commerce/controller/auth/verify_code_signup_controller.dart';
import 'package:e_commerce/controller/forget%20password/verify_code_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../widget/auth/custombodytext.dart';
import '../../widget/auth/customtexttitle.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeCotrollerImp());
    VerifyCodeSignUpCotrollerImp verifyCodeSignUpCotrollerImp =
        Get.put(VerifyCodeSignUpCotrollerImp());
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.backgroundColor,
          title: Text(
            "44".tr,
            style: Get.textTheme.displayLarge!.copyWith(
              color: AppColor.greyDark,
            ),
          ),
        ),
        body: GetBuilder<VerifyCodeCotrollerImp>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 40,
              ),
              child: ListView(
                children: [
                  SizedBox(height: Get.width / 32),
                  CustomTitleAuth(
                    title: "45".tr,
                  ),
                  SizedBox(height: Get.width / 56),
                  CustomTextBodyAuth(
                    text: "46".tr,
                    email: "${controller.email}",
                  ),
                  SizedBox(height: Get.width / 12),
                  OtpTextField(
                    textStyle: Get.textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                    ),
                    numberOfFields: 5,
                    fieldWidth: 48,
                    borderRadius: BorderRadius.circular(16),
                    borderColor: AppColor.primaryColor,
                    focusedBorderColor: AppColor.primaryColor,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verifyCode) {
                      controller.goToSuccessResetPassword(verifyCode);
                    },
                  ),
                  SizedBox(height: Get.width / 12),
                  Align(
                    child: MaterialButton(
                      color: AppColor.primaryColor,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      onPressed: () {
                        verifyCodeSignUpCotrollerImp.resendVer();
                      },
                      child: Text(
                        'Resend Verify Code',
                        style: Get.textTheme.displayLarge!.copyWith(
                          height: 1,
                          fontSize: 16,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.width / 6),
                ],
              ),
            );
          },
        ));
  }
}

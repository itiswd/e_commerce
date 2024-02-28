import 'package:e_commerce/controller/presentation/onboarding_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: AppColor.primaryColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 100,
      ),
      onPressed: () {
        controller.next();
      },
      child: Padding(
        padding: EdgeInsets.only(top: widgetsPositions() == true ? 0 : 4),
        child: Text(
          "8".tr,
          style: const TextStyle(
            color: AppColor.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
          ),
        ),
      ),
    );
  }
}

import 'package:e_commerce/controller/presentation/onboarding_controller.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            const Spacer(flex: 10),
            Image.asset(
              onBoardingList[i].image!,
              width: Get.width - 80,
              // height: Get.width - 80,
            ),
            const Spacer(flex: 4),
            Text(
              onBoardingList[i].title!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                height: 1,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
            ),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                onBoardingList[i].body!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        );
      },
    );
  }
}

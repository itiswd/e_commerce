import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_ios)),
            const SizedBox(height: 8),
            Center(
              child: Image.asset(
                ImageAsset.logo,
                width: 160,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                '167'.tr,
                style: Get.textTheme.displayLarge!.copyWith(
                  fontSize: 32,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '168'.tr,
              style: Get.textTheme.displayLarge!.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '169'.tr,
              style: Get.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.normal,
                color: AppColor.greyDark,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '170'.tr,
              style: Get.textTheme.displayLarge!.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '171'.tr,
              style: Get.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.normal,
                color: AppColor.greyDark,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '172'.tr,
              style: Get.textTheme.displayLarge!.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '173'.tr,
              style: Get.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.normal,
                color: AppColor.greyDark,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '174'.tr,
              style: Get.textTheme.displayLarge!.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '175'.tr,
              style: Get.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.normal,
                color: AppColor.greyDark,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Text(
        title,
        style: Get.textTheme.headlineMedium!.copyWith(
          color: AppColor.primaryColorVeryDark,
        ),
      ),
    );
  }
}

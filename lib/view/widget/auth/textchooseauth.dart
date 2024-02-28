import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomChooseAuth extends StatelessWidget {
  final String text01;
  final String text02;
  final void Function() onTap;
  const CustomChooseAuth({
    super.key,
    required this.text01,
    required this.text02,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text01,
          style: Get.textTheme.bodyLarge!.copyWith(
            color: AppColor.black,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text02,
            style: Get.textTheme.bodyLarge!.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

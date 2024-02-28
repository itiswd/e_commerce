import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String text;
  final String? email;
  const CustomTextBodyAuth({
    super.key,
    required this.text,
    this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: text,
        ),
        TextSpan(
          text: email,
          style: Get.textTheme.bodyLarge!.copyWith(
            color: AppColor.primaryColor,
          ),
        )
      ]),
      textAlign: TextAlign.center,
      style: Get.textTheme.bodyLarge,
    );
  }
}

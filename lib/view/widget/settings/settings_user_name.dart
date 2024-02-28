import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserName extends StatelessWidget {
  final String text;
  const UserName({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Container(
        height: 160,
        color: AppColor.primaryColor,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:
                EdgeInsets.only(bottom: widgetsPositions() == true ? 48 : 44),
            child: Text(
              '${'64'.tr}$text!',
              style: Get.textTheme.headlineLarge!.copyWith(
                color: AppColor.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

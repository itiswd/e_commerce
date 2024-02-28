import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            top: widgetsPositions() == true ? 0 : 4,
          ),
          child: Text(
            text,
            style: Get.textTheme.bodyLarge!.copyWith(
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}

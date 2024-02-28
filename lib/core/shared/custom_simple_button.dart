import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSimpleButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustomSimpleButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 0,
      ),
      child: MaterialButton(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        child: Padding(
          padding: EdgeInsets.only(top: widgetsPositions() == true ? 0 : 4),
          child: Text(
            text,
            style: Get.textTheme.displayLarge!.copyWith(
              color: AppColor.white,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}

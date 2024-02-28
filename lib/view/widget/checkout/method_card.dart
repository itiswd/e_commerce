import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatelessWidget {
  final String title;
  final bool isActive;
  final void Function()? onPressed;
  const PaymentMethod({
    super.key,
    required this.title,
    required this.isActive,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: AppColor.primaryColorLight,
      color: AppColor.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isActive == true
              ? AppColor.primaryColorDark
              : AppColor.transparent,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.only(top: widgetsPositions() == true ? 0 : 4),
        child: Text(
          title,
          style: Get.textTheme.bodyLarge!.copyWith(
            color: AppColor.black,
          ),
        ),
      ),
    );
  }
}

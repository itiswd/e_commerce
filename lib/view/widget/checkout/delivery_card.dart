import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DeliveryType extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  final void Function()? onTap;
  const DeliveryType({
    super.key,
    required this.image,
    required this.title,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.white,
      surfaceTintColor: AppColor.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isActive == true
              ? AppColor.primaryColorDark
              : AppColor.transparent,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: AppColor.primaryColorLight,
        child: Column(
          children: [
            Lottie.asset(
              image,
              width: 120,
              height: 120,
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: EdgeInsets.only(top: widgetsPositions() == true ? 0 : 4),
              child: Text(
                title,
                style: Get.textTheme.displayLarge!.copyWith(
                  color: AppColor.black,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}

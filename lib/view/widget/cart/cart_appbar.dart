import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartAppbar extends StatelessWidget {
  const CartAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColor.primaryColor,
      title: Padding(
        padding: EdgeInsets.only(top: widgetsPositions() == true ? 0 : 4),
        child: Text(
          '72'.tr,
          style: Get.textTheme.displayLarge!.copyWith(
            fontSize: 32,
            color: AppColor.white,
          ),
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          Get.back(closeOverlays: true);
        },
        child: Container(
          color: AppColor.primaryColor,
          padding: const EdgeInsets.all(12),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.white,
          ),
        ),
      ),
    );
  }
}

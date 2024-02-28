import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicAppBar extends StatelessWidget {
  final String text;
  const BasicAppBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 72,
      centerTitle: true,
      backgroundColor: AppColor.primaryColor,
      title: Padding(
        padding: EdgeInsets.only(top: widgetsPositions() == true ? 0 : 4),
        child: Text(
          text,
          style: Get.textTheme.displayLarge!.copyWith(
            fontSize: 32,
            color: AppColor.white,
          ),
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          color: AppColor.transparent,
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

import 'package:e_commerce/controller/pages/homescreen_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAppbar extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  final int pageNum;
  const CustomButtonAppbar({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.pageNum,
  });

  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImp controller = Get.put(HomeScreenControllerImp());
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(80),
        ),
        padding: EdgeInsets.symmetric(
          horizontal:
              widgetsPositions() == true ? Get.width / 28 : Get.width / 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: controller.page == pageNum
                  ? AppColor.primaryColor
                  : AppColor.greyDark,
            ),
            Text(
              title,
              style: Get.textTheme.bodyLarge!.copyWith(
                fontSize: widgetsPositions() == true ? 12 : 14,
                color: controller.page == pageNum
                    ? AppColor.primaryColorDark
                    : AppColor.greyDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

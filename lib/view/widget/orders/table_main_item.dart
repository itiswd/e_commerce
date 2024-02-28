import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableMainItem extends StatelessWidget {
  final String text;
  const TableMainItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: widgetsPositions() == true ? 8 : 12, bottom: 8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Get.textTheme.displayMedium!.copyWith(
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}

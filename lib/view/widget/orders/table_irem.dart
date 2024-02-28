import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableItem extends StatelessWidget {
  final String text;
  const TableItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: widgetsPositions() == true ? 4 : 8,
          bottom: 4,
          left: 4,
          right: 4),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Get.textTheme.bodyLarge!.copyWith(
          color: AppColor.black,
        ),
      ),
    );
  }
}

import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalItemRow extends StatelessWidget {
  final int totalCount;
  const TotalItemRow({
    super.key,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: const BoxDecoration(
              color: AppColor.primaryColorDark,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Padding(
                padding:
                    EdgeInsets.only(top: widgetsPositions() == true ? 0 : 4),
                child: Text(
                  '${'73'.tr} $totalCount ${totalCount == 1 ? '74'.tr : '75'.tr}',
                  style: Get.textTheme.displayLarge!.copyWith(
                    color: AppColor.white,
                    fontSize: 18,
                    height: 1,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

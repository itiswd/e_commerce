import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountAndPrice extends StatelessWidget {
  final void Function() onAdd;
  final void Function() onRemove;
  final String count;
  final String price;
  final String priceAfter;
  final bool visible;
  const CountAndPrice({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.count,
    required this.price,
    required this.visible,
    required this.priceAfter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widgetsPositions() == true ? 24 : 8,
        right: widgetsPositions() == true ? 8 : 24,
      ),
      child: Row(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onAdd,
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: widgetsPositions() == true ? 0 : 4),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Text(
                    count,
                    style: Get.textTheme.displayLarge,
                  ),
                ),
              ),
              IconButton(
                onPressed: onRemove,
                icon: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: visible,
                child: Text(
                  "$price \$",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.headlineLarge!.copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: AppColor.orangeAccent,
                    decorationThickness: 2,
                    color: AppColor.orangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    height: 1,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "$priceAfter \$",
                textAlign: TextAlign.center,
                style: Get.textTheme.headlineLarge!.copyWith(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  height: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:e_commerce/controller/pages/cart_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/cart/product_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartMainCard extends GetView<CartController> {
  final String name;
  final String price;
  final String count;
  final String imageName;

  final void Function()? onAdd;
  final void Function()? onRemove;
  const CartMainCard({
    super.key,
    required this.name,
    required this.price,
    this.onAdd,
    this.onRemove,
    required this.count,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.white,
      surfaceTintColor: AppColor.white,
      margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          //product image
          CartProductImage(
            imageName: imageName,
          ),
          const SizedBox(width: 8.0),
          //name and price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Get.textTheme.displayMedium!.copyWith(
                    overflow: name.length > 16 ? TextOverflow.ellipsis : null,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: Get.textTheme.displayMedium!.copyWith(
                    color: AppColor.orangeAccent,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          //values
          Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: onAdd,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_up,
                    size: 32,
                  ),
                ),
              ),
              Text(
                count,
                style: Get.textTheme.displayMedium,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: onRemove,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 32,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

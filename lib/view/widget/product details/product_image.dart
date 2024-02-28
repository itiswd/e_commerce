import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImage extends StatelessWidget {
  final String link;
  const ProductImage({
    super.key,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      // clipBehavior: Clip.none,
      children: [
        Container(
          height: Get.width / 1.1,
          decoration: const BoxDecoration(
            color: AppColor.primaryColorDark,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(88),
              bottomRight: Radius.circular(88.4),
            ),
          ),
        ),
        Positioned(
          right: 0.0,
          bottom: -0.4,
          child: Container(
            width: Get.width / 2,
            height: Get.width / 2,
            decoration: BoxDecoration(
              color: AppColor.primaryColorLight,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(200),
                bottomRight: Radius.circular(88),
              ),
            ),
          ),
        ),
        Positioned(
          top: Get.width / 4.5,
          right: Get.width / 7,
          left: Get.width / 7,
          child: CachedNetworkImage(
            imageUrl: link,
            height: Get.width / 1.8,
          ),
        ),
      ],
    );
  }
}

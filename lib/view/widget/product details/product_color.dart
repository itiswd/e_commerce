import 'package:e_commerce/view/widget/product%20details/custom_color_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductColor extends StatelessWidget {
  const ProductColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Colors',
            style: Get.textTheme.displayLarge,
          ),
        ),
        SizedBox(height: Get.width / 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              CustomColor(
                color: Colors.black,
                colorName: 'Black',
                selected: true,
              ),
              CustomColor(
                color: Colors.grey,
                colorName: 'Grey',
                selected: false,
              ),
              CustomColor(
                color: Colors.red,
                colorName: 'Red',
                selected: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

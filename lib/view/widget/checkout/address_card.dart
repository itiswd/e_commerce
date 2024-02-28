import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddress extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive;
  final void Function()? onTap;
  const ShippingAddress({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppColor.white,
      surfaceTintColor: AppColor.primaryColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isActive == true
              ? AppColor.primaryColorDark
              : AppColor.transparent,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: AppColor.primaryColorLight,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              title,
              style: Get.textTheme.displayLarge,
            ),
            subtitle: Text(
              subtitle,
              overflow: TextOverflow.ellipsis,
              style: Get.textTheme.bodyLarge!,
            ),
            leading: const Icon(
              Icons.location_on,
              color: AppColor.orangeAccent,
            ),
          ),
        ),
      ),
    );
  }
}

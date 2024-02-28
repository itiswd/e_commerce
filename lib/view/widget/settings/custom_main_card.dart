import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMainCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  const CustomMainCard(
      {super.key, required this.text, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        splashColor: AppColor.primaryColorLight,
        title: Text(
          text,
          style: Get.textTheme.displayLarge!.copyWith(),
        ),
        trailing: Icon(
          icon,
          size: 28,
          color: Colors.black,
        ),
        onTap: onTap,
      ),
    );
  }
}

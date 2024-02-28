import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitleAuth extends StatelessWidget {
  final String title;
  const CustomTitleAuth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Get.textTheme.headlineLarge!.copyWith(),
    );
  }
}

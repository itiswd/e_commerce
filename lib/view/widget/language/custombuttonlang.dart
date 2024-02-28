import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonLang(
      {super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(24)),
      color: AppColor.primaryColor,
      textColor: Colors.white,
      minWidth: Get.width - 160,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          textButton,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
          ),
        ),
      ),
    );
  }
}

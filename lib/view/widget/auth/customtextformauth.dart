import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String lableText;
  final IconData iconData;
  final TextEditingController myController;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obSecureText;
  final void Function()? onTapIcon;
  const CustomTextFormAuth({
    super.key,
    required this.hintText,
    required this.lableText,
    required this.iconData,
    required this.myController,
    required this.valid,
    required this.isNumber,
    this.obSecureText,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(
              decimal: true,
            )
          : TextInputType.text,
      obscureText: obSecureText == null || obSecureText == false ? false : true,
      validator: valid,
      controller: myController,
      style: Get.textTheme.bodyLarge!.copyWith(
        color: Colors.black,
        height: widgetsPositions() == true ? 1 : 1.33,
      ),
      cursorHeight: widgetsPositions() == true ? null : 22,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Get.textTheme.bodyMedium!.copyWith(
          height: widgetsPositions() == true ? null : 1.33,
          color: AppColor.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 32,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(
          lableText,
          style: Get.textTheme.bodyLarge,
        ),
        suffixIcon: GestureDetector(
          onTap: onTapIcon,
          child: Icon(iconData),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}

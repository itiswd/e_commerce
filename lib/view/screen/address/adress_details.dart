import 'package:e_commerce/controller/address/address_details_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/valid_input.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:e_commerce/core/shared/custom_simple_button.dart';
import 'package:e_commerce/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddressDetailsController controller = Get.put(AddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        title: Padding(
          padding: EdgeInsets.only(top: widgetsPositions() == true ? 0 : 4),
          child: Text(
            '104'.tr,
            style:
                Get.textTheme.headlineMedium!.copyWith(color: AppColor.white),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            //city
            CustomTextFormAuth(
              hintText: '105'.tr,
              lableText: '106'.tr,
              iconData: Icons.location_city,
              myController: controller.city!,
              valid: (val) {
                return validInput(val!, 4, 50, 'text');
              },
              isNumber: false,
            ),
            const SizedBox(height: 24),
            //street
            CustomTextFormAuth(
              hintText: '107'.tr,
              lableText: '108'.tr,
              iconData: Icons.streetview_outlined,
              myController: controller.street!,
              valid: (val) {
                return validInput(val!, 4, 50, 'text');
              },
              isNumber: false,
            ),
            const SizedBox(height: 24),
            //city
            CustomTextFormAuth(
              hintText: '109'.tr,
              lableText: '110'.tr,
              iconData: Icons.location_on,
              myController: controller.name!,
              valid: (val) {
                return validInput(val!, 4, 50, 'text');
              },
              isNumber: false,
            ),
            const SizedBox(height: 16),
            CustomSimpleButton(
              text: '111'.tr,
              onPressed: () {
                controller.addAddress();
              },
            ),
          ],
        ),
      ),
    );
  }
}

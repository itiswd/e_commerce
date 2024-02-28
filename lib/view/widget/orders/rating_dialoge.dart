import 'package:e_commerce/controller/orders/archive_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showRatingDialog(BuildContext context, String ordersId) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        '134'.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        '135'.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      // your app's logo?
      image: Image.asset(
        'assets/images/shopping-cart.png',
        width: 160,
        height: 160,
      ),
      submitButtonText: '136'.tr,
      submitButtonTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.primaryColorDark,
      ),
      commentHint: '137'.tr,
      starSize: 32.0,
      onCancelled: () {},
      onSubmitted: (response) {
        ArchiveControllerImp controller = Get.put(ArchiveControllerImp());
        controller.rateOrder(ordersId, response.rating, response.comment);
      },
    ),
  );
}

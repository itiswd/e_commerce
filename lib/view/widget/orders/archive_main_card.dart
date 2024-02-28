import 'package:e_commerce/controller/orders/archive_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:e_commerce/data/model/pending_model.dart';
import 'package:e_commerce/view/widget/orders/rating_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class ArchiveMainCard extends GetView<ArchiveControllerImp> {
  final PendingModel pendingModel;

  const ArchiveMainCard({
    super.key,
    required this.pendingModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.white,
      surfaceTintColor: AppColor.primaryColorLight,
      margin: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Order Number And date
            Row(
              children: [
                //Order number
                Text.rich(
                  TextSpan(
                    text: '113'.tr,
                    children: [
                      TextSpan(
                        text: '#${pendingModel.ordersId}',
                        style: Get.textTheme.displayLarge!.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  style: Get.textTheme.displayLarge,
                ),
                const Spacer(),
                //Order date
                Text(
                  Jiffy.parse('${pendingModel.ordersDatetime}').fromNow(),
                  textDirection: TextDirection.ltr,
                  style: Get.textTheme.bodyMedium,
                )
              ],
            ),
            const SizedBox(height: 16),
            //Order Type
            Text.rich(
              TextSpan(
                text: '114'.tr,
                children: [
                  TextSpan(
                    text: controller.printOrderType(pendingModel.ordersType),
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
              style: Get.textTheme.bodyLarge,
            ),
            //Order Price
            Text.rich(
              TextSpan(
                text: '115'.tr,
                children: [
                  TextSpan(
                    text: '${pendingModel.ordersPrice}\$',
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
              style: Get.textTheme.bodyLarge,
            ),
            //Delivery Price
            Text.rich(
              TextSpan(
                text: '116'.tr,
                children: [
                  TextSpan(
                    text: '${pendingModel.ordersDeliveryPrice}\$',
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
              style: Get.textTheme.bodyLarge,
            ),
            //Payment Method
            Text.rich(
              TextSpan(
                text: '117'.tr,
                children: [
                  TextSpan(
                    text: controller
                        .printPaymentMethod(pendingModel.ordersPaymentMethod),
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
              style: Get.textTheme.bodyLarge,
            ),
            //Order Status
            Text.rich(
              TextSpan(
                text: '118'.tr,
                children: [
                  TextSpan(
                    text:
                        controller.printOrderStatus(pendingModel.ordersStatus),
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
              style: Get.textTheme.bodyLarge,
            ),
            const Divider(),
            //Total Price
            Text.rich(
              TextSpan(
                text: '119'.tr,
                children: [
                  TextSpan(
                    text: '${pendingModel.ordersTotalPrice}\$',
                    style: Get.textTheme.displayLarge!.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
              style: Get.textTheme.displayLarge!.copyWith(
                color: AppColor.primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Go To Details
                MaterialButton(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: AppColor.primaryColor,
                  onPressed: () {
                    Get.toNamed(AppRoutes.ordersDetails,
                        arguments: {"pendingmodel": pendingModel});
                  },
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: widgetsPositions() == true ? 0 : 4),
                      child: Text(
                        '120'.tr,
                        style: Get.textTheme.bodyMedium!.copyWith(
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ),
                //Rating
                if (pendingModel.ordersRating == 0)
                  MaterialButton(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    color: AppColor.primaryColor,
                    onPressed: () {
                      showRatingDialog(
                          context, pendingModel.ordersId.toString());
                    },
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: widgetsPositions() == true ? 0 : 4),
                        child: Text(
                          '133'.tr,
                          style: Get.textTheme.bodyMedium!.copyWith(
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:e_commerce/controller/pages/cart_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartBottomNavigation extends StatelessWidget {
  final double totalItemsPrice;
  final int discount;
  final int shipping;
  final TextEditingController couponController;
  final void Function()? onApply;
  final void Function()? onOrder;
  const CartBottomNavigation({
    super.key,
    required this.totalItemsPrice,
    required this.couponController,
    required this.discount,
    required this.shipping,
    this.onApply,
    this.onOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.white,
      surfaceTintColor: AppColor.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
      child: Column(
        children: [
          //apply coupon
          GetBuilder<CartControllerImp>(
            builder: (controller) {
              return Container(
                decoration: BoxDecoration(
                  color: controller.couponName == null
                      ? AppColor.primaryColorLight
                      : AppColor.primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: controller.couponName == null
                    ? Row(
                        children: [
                          //text Form Field
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  right: 8,
                                  left: 16,
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: TextFormField(
                                    controller: couponController,
                                    maxLines: 1,
                                    cursorHeight:
                                        widgetsPositions() == true ? 16 : null,
                                    cursorColor: AppColor.grey,
                                    style: Get.textTheme.bodyLarge!.copyWith(
                                      color: AppColor.black,
                                      height: widgetsPositions() == true
                                          ? 1.1
                                          : null,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: '76'.tr,
                                      hintStyle: TextStyle(
                                        height: widgetsPositions() == true
                                            ? 1.1
                                            : 1.2,
                                        color: AppColor.grey,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //apply
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColor.primaryColorDark,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: InkWell(
                                onTap: onApply,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 6,
                                    left: 6,
                                    bottom: widgetsPositions() == true ? 7 : 4,
                                    top: widgetsPositions() == true ? 7 : 8,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '77'.tr,
                                      style: Get.textTheme.bodyLarge!.copyWith(
                                        color: AppColor.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                          right: 4,
                          left: 4,
                          bottom: 4,
                          top: widgetsPositions() == true ? 4 : 8,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '78'.tr,
                                style: Get.textTheme.displayLarge!.copyWith(
                                  color: AppColor.white,
                                ),
                              ),
                              Text(
                                "  ' ${controller.couponName!} '",
                                style: Get.textTheme.displayLarge!.copyWith(
                                  color: AppColor.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              );
            },
          ),
          //price
          Padding(
            padding: EdgeInsets.only(
                top: widgetsPositions() == true ? 8 : 12, right: 16, left: 16),
            child: Row(
              children: [
                Text(
                  '79'.tr,
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: AppColor.black,
                  ),
                ),
                const Spacer(),
                Text(
                  '$totalItemsPrice\$',
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: AppColor.black,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          //shipping
          Padding(
            padding: EdgeInsets.only(
                top: widgetsPositions() == true ? 8 : 12, right: 16, left: 16),
            child: Row(
              children: [
                Text(
                  '80'.tr,
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: AppColor.black,
                  ),
                ),
                const Spacer(),
                Text(
                  '$shipping\$',
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: AppColor.black,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          //discount
          Padding(
            padding: EdgeInsets.only(
                top: widgetsPositions() == true ? 8 : 12, right: 16, left: 16),
            child: Row(
              children: [
                Text(
                  '81'.tr,
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: AppColor.orangeAccent,
                  ),
                ),
                const Spacer(),
                Text(
                  '$discount%',
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: AppColor.orangeAccent,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.3,
            color: Colors.grey,
          ),
          //total price
          Padding(
            padding: EdgeInsets.only(
                bottom: widgetsPositions() == true ? 12 : 8,
                right: 16,
                left: 16),
            child: Row(
              children: [
                Text(
                  '82'.tr,
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: AppColor.primaryColorDark,
                  ),
                ),
                const Spacer(),
                Text(
                  '${totalItemsPrice + shipping}\$',
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: AppColor.primaryColorDark,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          //place order
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: const BoxDecoration(
                    color: AppColor.primaryColorDark,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  child: InkWell(
                    onTap: onOrder,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: widgetsPositions() == true ? 0 : 4),
                        child: Text(
                          '83'.tr,
                          style: Get.textTheme.displayLarge!.copyWith(
                            color: AppColor.white,
                            fontSize: 18,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

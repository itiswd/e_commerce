import 'package:e_commerce/controller/pages/checkout_controller.dart';
import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:e_commerce/view/widget/checkout/address_card.dart';
import 'package:e_commerce/view/widget/checkout/delivery_card.dart';
import 'package:e_commerce/view/widget/checkout/main_title.dart';
import 'package:e_commerce/view/widget/checkout/method_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends GetView<CheckoutControllerImp> {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp controller = Get.put(CheckoutControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        title: Padding(
          padding: EdgeInsets.only(top: widgetsPositions() == true ? 0 : 4),
          child: Text(
            '84'.tr,
            style: Get.textTheme.displayLarge!.copyWith(
              fontSize: 32,
              color: AppColor.white,
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            color: AppColor.primaryColor,
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, bottom: 8, top: 0),
        child: MaterialButton(
          padding: const EdgeInsets.all(0),
          color: AppColor.primaryColor,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed: () {
            controller.checkout();
          },
          child: Padding(
            padding: EdgeInsets.only(top: widgetsPositions() == true ? 0 : 4),
            child: Text(
              '85'.tr,
              style: Get.textTheme.displayLarge!.copyWith(
                color: AppColor.white,
                height: 1,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder<CheckoutControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                child: ListView(
                  children: [
                    //payment
                    MainTitle(title: '86'.tr),
                    const SizedBox(height: 16.0),
                    PaymentMethod(
                      title: '87'.tr,
                      isActive: controller.paymentMethod == '0' ? true : false,
                      onPressed: () {
                        controller.setPaymentMethod('0');
                      },
                    ),
                    PaymentMethod(
                      title: '88'.tr,
                      isActive: controller.paymentMethod == '1' ? true : false,
                      onPressed: () {
                        controller.setPaymentMethod('1');
                      },
                    ),
                    const SizedBox(height: 24.0),
                    //delivery
                    MainTitle(title: '89'.tr),
                    const SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DeliveryType(
                          image: 'assets/lottie/delivery.json',
                          title: '90'.tr,
                          isActive:
                              controller.deliveryType == '0' ? true : false,
                          onTap: () {
                            controller.setDeliveryType('0');
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        DeliveryType(
                          image: 'assets/lottie/drivethru.json',
                          title: '91'.tr,
                          isActive:
                              controller.deliveryType == '1' ? true : false,
                          onTap: () {
                            controller.setDeliveryType('1');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    //shipping address
                    Visibility(
                      visible: controller.deliveryType == '0' ? true : false,
                      child: controller.dataAddress.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainTitle(title: '92'.tr),
                                const SizedBox(height: 16.0),
                                ...List.generate(
                                  controller.dataAddress.length,
                                  (index) {
                                    return ShippingAddress(
                                      title:
                                          '${controller.dataAddress[index].addressName}',
                                      subtitle:
                                          '${controller.dataAddress[index].addressCity}, ${controller.dataAddress[index].addressStreet}',
                                      isActive: controller.addressId ==
                                              '${controller.dataAddress[index].addressId}'
                                          ? true
                                          : false,
                                      onTap: () {
                                        controller.setAddressId(
                                            '${controller.dataAddress[index].addressId}');
                                      },
                                    );
                                  },
                                )
                              ],
                            )
                          : Card(
                              elevation: 2,
                              color: AppColor.white,
                              surfaceTintColor: AppColor.white,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        '93'.tr,
                                        style:
                                            Get.textTheme.bodyLarge!.copyWith(
                                          color: AppColor.black,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      MaterialButton(
                                        color: AppColor.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        onPressed: () {
                                          Get.toNamed(AppRoutes.addressAdd);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          child: Column(
                                            children: [
                                              const Icon(
                                                Icons.add,
                                                color: AppColor.white,
                                              ),
                                              Text(
                                                '94'.tr,
                                                style: Get.textTheme.bodyLarge!
                                                    .copyWith(
                                                  color: AppColor.white,
                                                  height: 1.5,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:e_commerce/controller/orders/orders_details_controller.dart';
import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translated_database.dart';
import 'package:e_commerce/core/shared/appbar.dart';
import 'package:e_commerce/view/widget/orders/table_irem.dart';
import 'package:e_commerce/view/widget/orders/table_main_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      body: Column(
        children: [
          BasicAppBar(text: '127'.tr),
          Expanded(
            child: GetBuilder<OrdersDetailsController>(
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      //Details
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          elevation: 2,
                          color: AppColor.white,
                          surfaceTintColor: AppColor.primaryColorLight,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                //Quantity and price
                                Table(
                                  border: TableBorder.symmetric(
                                    inside: const BorderSide(),
                                  ),
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: [
                                    TableRow(
                                      children: [
                                        TableMainItem(text: '128'.tr),
                                        TableMainItem(text: '129'.tr),
                                        TableMainItem(text: '130'.tr),
                                      ],
                                    ),
                                    ...List.generate(
                                      controller.data.length,
                                      (index) => TableRow(
                                        children: [
                                          TableItem(
                                            text: translatedDatabase(
                                                controller
                                                    .data[index].itemsNameAr!,
                                                controller
                                                    .data[index].itemsName!),
                                          ),
                                          TableItem(
                                            text: controller
                                                .data[index].countitems!
                                                .toString(),
                                          ),
                                          TableItem(
                                            text: controller
                                                .data[index].itemsprice!
                                                .floorToDouble()
                                                .toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                //Delivery price
                                if (controller.pendingModel!.ordersType == 0)
                                  Table(
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    border: TableBorder.symmetric(
                                      inside: const BorderSide(),
                                    ),
                                    children: [
                                      TableRow(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            top: BorderSide(),
                                          ),
                                        ),
                                        children: [
                                          TableMainItem(
                                            text: '131'.tr,
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          TableItem(
                                            text: controller.pendingModel!
                                                .ordersDeliveryPrice!
                                                .toDouble()
                                                .toString(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                //Total Price
                                Table(
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  border: TableBorder.symmetric(
                                    inside: const BorderSide(),
                                  ),
                                  children: [
                                    TableRow(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          top: BorderSide(),
                                        ),
                                      ),
                                      children: [
                                        controller.pendingModel!.ordersCoupon !=
                                                0
                                            ? TableMainItem(text: '132'.tr)
                                            : TableMainItem(text: '82'.tr),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        TableItem(
                                            text: controller
                                                .pendingModel!.ordersTotalPrice!
                                                .toDouble()
                                                .toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //Address
                      if (controller.pendingModel!.ordersType == 0)
                        Card(
                          elevation: 2,
                          color: AppColor.white,
                          surfaceTintColor: AppColor.primaryColorLight,
                          margin: const EdgeInsets.only(
                              right: 16, left: 16, bottom: 16),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(
                                '${controller.pendingModel!.addressName}',
                                style: Get.textTheme.displayLarge,
                              ),
                              subtitle: Text(
                                "${controller.pendingModel!.addressCity}, ${controller.pendingModel!.addressStreet}",
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
                      //Map
                      if (controller.pendingModel!.ordersType == 0)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Card(
                            elevation: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                height: 300,
                                child: GoogleMap(
                                  mapType: MapType.normal,
                                  markers: controller.markers.toSet(),
                                  compassEnabled: true,
                                  initialCameraPosition:
                                      controller.cameraPosition!,
                                  onMapCreated:
                                      (GoogleMapController controllermap) {
                                    controller.controllerCompleter
                                        .complete(controllermap);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

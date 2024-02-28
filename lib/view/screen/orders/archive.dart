import 'package:e_commerce/controller/orders/archive_controller.dart';
import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/core/shared/appbar.dart';
import 'package:e_commerce/view/widget/orders/archive_main_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveControllerImp());
    return Scaffold(
      body: Column(
        children: [
          BasicAppBar(
            text: '126'.tr,
          ),
          Expanded(
            child: GetBuilder<ArchiveControllerImp>(
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return ArchiveMainCard(
                        pendingModel: controller.data[index],
                      );
                    },
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

import 'package:e_commerce/controller/orders/pending_controller.dart';
import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/core/shared/appbar.dart';
import 'package:e_commerce/view/widget/orders/order_main_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersControllerImp());
    return Scaffold(
      body: Column(
        children: [
          BasicAppBar(
            text: '112'.tr,
          ),
          Expanded(
            child: GetBuilder<PendingOrdersControllerImp>(
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return OrderMainCard(
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

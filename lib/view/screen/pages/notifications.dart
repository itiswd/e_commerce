import 'package:e_commerce/controller/pages/notification_controller.dart';
import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/core/shared/appbar.dart';
import 'package:e_commerce/view/widget/orders/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      body: Column(
        children: [
          const BasicAppBar(
            text: 'Notifications',
          ),
          Expanded(
            child: GetBuilder<NotificationController>(
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return NotificationCard(
                        title: controller.data[index]['notifications_title'],
                        body: controller.data[index]['notifications_body'],
                        date: controller.data[index]['notifications_datetime']!,
                        order: '${controller.data[index]['notifications_id']}',
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

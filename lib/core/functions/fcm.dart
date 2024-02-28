// ignore_for_file: unused_local_variable

import 'package:e_commerce/controller/orders/pending_controller.dart';
import 'package:e_commerce/controller/pages/notification_controller.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen(
    (message) {
      FlutterRingtonePlayer.playNotification();
      Get.snackbar(message.notification!.title!, message.notification!.body!);
      refreshPageOrder(message.data);
    },
  );
}

refreshPageOrder(data) {
  if (Get.currentRoute == AppRoutes.pendingOrders &&
      data['pagename'] == 'pending_orders') {
    PendingOrdersControllerImp controllerImp = Get.find();
    controllerImp.refreshOrders();
  }
  if (Get.currentRoute == AppRoutes.notifications &&
      data['pagename'] == 'pending_orders') {
    NotificationController controller = Get.find();
    controller.refreshPage();
  }
}

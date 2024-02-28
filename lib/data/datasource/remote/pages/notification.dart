import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getNotificationData(String id) async {
    var response = await crud.postData(AppLinks.notifications, {
      'users_id': id,
    });
    return response.fold((l) => l, (r) => r);
  }
}

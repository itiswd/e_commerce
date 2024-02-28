import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class PendingData {
  Crud crud;
  PendingData(this.crud);
  getData(String usersId) async {
    var response = await crud.postData(
      AppLinks.pending,
      {
        'id': usersId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String ordersId) async {
    var response = await crud.postData(
      AppLinks.deleteOrder,
      {
        'id': ordersId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}

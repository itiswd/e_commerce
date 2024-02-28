import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id, usersId) async {
    var response = await crud.postData(AppLinks.items, {
      "id": id.toString(),
      "users_id": usersId,
    });
    return response.fold((l) => l, (r) => r);
  }
}

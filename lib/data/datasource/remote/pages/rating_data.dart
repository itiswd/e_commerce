import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class RatingData {
  Crud crud;
  RatingData(this.crud);
  getData(
    String ordersId,
    String rate,
    String comment,
  ) async {
    var response = await crud.postData(AppLinks.rating, {
      'orders_id': ordersId,
      'orders_rate': rate,
      'orders_comment': comment,
    });
    return response.fold((l) => l, (r) => r);
  }
}

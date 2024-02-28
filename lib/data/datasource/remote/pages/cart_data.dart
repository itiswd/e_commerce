import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String usersid, String itemsid) async {
    var response = await crud.postData(
      AppLinks.addCart,
      {
        'users_id': usersid.toString(),
        'items_id': itemsid.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String usersid, String itemsid) async {
    var response = await crud.postData(
      AppLinks.removeCart,
      {
        'users_id': usersid.toString(),
        'items_id': itemsid.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, String itemsid) async {
    var response = await crud.postData(
      AppLinks.getCountCart,
      {
        'users_id': usersid.toString(),
        'items_id': itemsid.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(
      AppLinks.viewCart,
      {
        'users_id': usersid.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName) async {
    var response = await crud.postData(
      AppLinks.checkCoupon,
      {
        "coupon_name": couponName,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}

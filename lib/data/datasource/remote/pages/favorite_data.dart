import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(
      AppLinks.addToFavorite,
      {
        'users_id': usersid.toString(),
        'items_id': itemsid.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(
      AppLinks.removeFromFavorite,
      {
        'users_id': usersid.toString(),
        'items_id': itemsid.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}

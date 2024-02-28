import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  viewFavorite(String id) async {
    var response = await crud.postData(
      AppLinks.viewFavorite,
      {'id': id.toString()},
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteFromFavorite(
    String id,
  ) async {
    var response = await crud.postData(
      AppLinks.deleteFromFavorite,
      {
        'id': id.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}

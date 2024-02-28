import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.postData(AppLinks.homePage, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLinks.search, {
      "search": search,
    });
    return response.fold((l) => l, (r) => r);
  }
}

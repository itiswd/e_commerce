import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.postData(AppLinks.test, {});
    return response.fold((l) => l, (r) => r);
  }
}

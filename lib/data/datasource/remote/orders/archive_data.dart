import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class ArchiveData {
  Crud crud;
  ArchiveData(this.crud);
  getData(String usersId) async {
    var response = await crud.postData(AppLinks.archive, {'id': usersId});
    return response.fold((l) => l, (r) => r);
  }
}

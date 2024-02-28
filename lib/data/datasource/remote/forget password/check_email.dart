import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class CheckEmailForgetPasswordData {
  Crud crud;
  CheckEmailForgetPasswordData(this.crud);
  postData(String email) async {
    var response = await crud.postData(AppLinks.checkEmail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}

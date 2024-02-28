import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(AppLinks.logIn, {
      "email": email.toString(),
      "password": password.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}

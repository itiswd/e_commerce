import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);
  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLinks.verifyCodeSignUp, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendVerifyCode(String email) async {
    var response = await crud.postData(AppLinks.resendVerCode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}

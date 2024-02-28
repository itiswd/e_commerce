import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  viewAddress(
    String usersid,
  ) async {
    var response = await crud.postData(
      AppLinks.viewAddress,
      {
        'users_id': usersid.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  addAddress(
    String usersid,
    String name,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.postData(
      AppLinks.addAddress,
      {
        'users_id': usersid.toString(),
        'name': name.toString(),
        'city': city.toString(),
        'street': street.toString(),
        'lat': lat.toString(),
        'long': long.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteAdress(
    String addressid,
  ) async {
    var response = await crud.postData(
      AppLinks.deleteAddress,
      {
        'address_id': addressid.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}

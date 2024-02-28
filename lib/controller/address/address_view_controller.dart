import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/pages/address_data.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  List<AddressViewModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  viewAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.viewAddress(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => AddressViewModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteAddress(String addressid) {
    addressData.deleteAdress(addressid);
    data.removeWhere((element) => element.addressId.toString() == addressid);
    update();
  }

  @override
  void onInit() {
    viewAddress();
    super.onInit();
  }
}

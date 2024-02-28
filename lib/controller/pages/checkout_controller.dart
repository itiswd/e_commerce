import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/pages/address_data.dart';
import 'package:e_commerce/data/datasource/remote/pages/checkout_data.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController {
  setPaymentMethod(String val);
  setDeliveryType(String val);
  setAddressId(String val);
  getAddressId();
  checkout();
}

class CheckoutControllerImp extends CheckoutController {
  AddressData addressData = AddressData(Get.find());
  CheckoutData checkoutData = CheckoutData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  List<AddressViewModel> dataAddress = [];

  String? paymentMethod;
  String? deliveryType;
  String addressId = '0';
  String? couponId;
  String? ordersPrice;
  String? couponDicount;

  @override
  setPaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  @override
  setDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  @override
  setAddressId(String val) {
    addressId = val;
    update();
  }

  @override
  getAddressId() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.viewAddress(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        dataAddress.addAll(dataList.map((e) => AddressViewModel.fromJson(e)));
        addressId = dataAddress[0].addressId!.toString();
      } else {
        statusRequest = StatusRequest.success;
      }
    }
    update();
  }

  @override
  checkout() async {
    if (paymentMethod == null) {
      return Get.defaultDialog(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        title: '158'.tr,
        middleText: '159'.tr,
      );
    }
    if (deliveryType == null) {
      return Get.defaultDialog(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        title: '158'.tr,
        middleText: '160'.tr,
      );
    }
    if (dataAddress.isEmpty && deliveryType == "0") {
      return Get.defaultDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title: '158'.tr,
          middleText: '161'.tr);
    }
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      'users_id': myServices.sharedPreferences.getString('id')!,
      'address_id': addressId.toString(),
      'orders_type': deliveryType.toString(),
      'delivery_price': '20',
      'order_price': ordersPrice,
      'coupon_id': couponId,
      'coupon_discount': couponDicount,
      'payment_method': paymentMethod.toString(),
    };
    var response = await checkoutData.checkout(data);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.home);
        FlutterRingtonePlayer.playNotification();
        Get.snackbar(
          duration: const Duration(seconds: 5),
          '162'.tr,
          '163'.tr,
        );
      }
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponId'];
    ordersPrice = Get.arguments['ordersPrice'];
    couponDicount = Get.arguments['couponDicount'].toString();
    getAddressId();
    super.onInit();
  }
}

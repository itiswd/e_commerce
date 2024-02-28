import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/pages/cart_data.dart';
import 'package:e_commerce/data/model/cart_model.dart';
import 'package:e_commerce/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  addToCart(String itemsId);
  goToCheckOut();
  priceAfterCoupon();
  removeFromCart(String itemsId);
  viewCart();
  checkCoupon();
  resetVars();
  refreshPage();
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  TextEditingController? couponCont;
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  List<CartModel> data = [];
  double? ordersPrice = 0;
  int totalItemsCount = 0;
  CouponModel? couponModel;
  int? couponDicount = 0;
  String? couponName;
  String? couponId;

  @override
  addToCart(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
      myServices.sharedPreferences.getString("id")!,
      itemsId,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //Do anything
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeFromCart(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
      myServices.sharedPreferences.getString("id")!,
      itemsId,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //Do anything
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  viewCart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCart(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == "success") {
          List responseData = response['datacart']['data'];
          Map responseCountPriceData = response['countprice'];
          data.clear();
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));
          totalItemsCount = int.parse(responseCountPriceData['totalcount']);
          ordersPrice = responseCountPriceData['totalprice'].toDouble()!;
          //Do anything
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(
      couponCont!.text,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> couponData = response['data'];
        couponModel = CouponModel.fromJson(couponData);
        couponDicount = couponModel!.couponDiscount!;
        couponName = couponModel!.couponName!;
        couponId = couponModel!.couponId!.toString();
      } else {
        couponDicount = 0;
        couponName = null;
        couponId = null;
        Get.defaultDialog(title: '47'.tr, middleText: '156'.tr);
      }
    }
    update();
  }

  @override
  goToCheckOut() {
    if (data.isEmpty) {
      Get.defaultDialog(title: '47'.tr, middleText: '157'.tr);
    } else {
      Get.toNamed(
        AppRoutes.checkOut,
        arguments: {
          'couponId': couponId ?? '0',
          'ordersPrice': ordersPrice.toString(),
          'couponDicount': couponDicount.toString(),
        },
      );
    }
  }

  @override
  priceAfterCoupon() {
    return (ordersPrice! - ordersPrice! * couponDicount! / 100).floorToDouble();
  }

  @override
  resetVars() {
    totalItemsCount = 0;
    ordersPrice = 0.0;
    data.clear();
  }

  @override
  refreshPage() {
    resetVars();
    viewCart();
  }

  @override
  void onInit() {
    couponCont = TextEditingController();
    viewCart();
    super.onInit();
  }
}

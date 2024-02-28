import 'package:e_commerce/controller/pages/search_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/pages/offers_data.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/data/model/offers_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends MainSearchCotroller {
  OffersData offersData = OffersData(Get.find());
  List<OffersModel> data = [];
  List<ItemsModel> itemsData = [];

  MyServices myServices = Get.find();

  getOffers() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    // update();
    var response = await offersData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData2 = response['data'];
        data.addAll(listData2.map((e) => OffersModel.fromJson(e)));
        itemsData.addAll(listData2.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    getOffers();
    search = TextEditingController();
    super.onInit();
  }
}

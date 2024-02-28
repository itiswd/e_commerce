import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/data/datasource/remote/pages/home_data.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainSearchCotroller extends GetxController {
  List<ItemsModel> searchData = [];
  late StatusRequest statusRequest;
  HomeData homeData = HomeData(Get.find());
  TextEditingController? search;
  bool isSearch = false;

  searchDataList() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchData.clear();
        List responseData = response['data'];
        searchData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkSearch(value) {
    if (value == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearch() {
    isSearch = true;

    searchDataList();
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }
}

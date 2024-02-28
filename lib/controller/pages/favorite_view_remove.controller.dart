import 'package:e_commerce/controller/pages/search_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/pages/my_favorite_data.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/data/model/my_favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteViewController extends MainSearchCotroller {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteModel> data = [];
  List<ItemsModel> itemsData = [];
  MyServices myServices = Get.find();

  viewFavorite() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.viewFavorite(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        itemsData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(String favoriteId) {
    favoriteData.deleteFromFavorite(favoriteId);
    data.removeWhere(
        (element) => element.favoriteId.toString() == favoriteId.toString());
    update();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    search = TextEditingController();
    viewFavorite();
    super.onInit();
  }
}

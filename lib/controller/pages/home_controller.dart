import 'package:e_commerce/controller/pages/search_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeController extends MainSearchCotroller {
  initialData();
  getData();
  goToItemsScreen(
    List categories,
    int selectedCat,
    String categoryid,
  );
  goToPageProductDetails(itemsModel);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;
  String? lang;

  List categories = [];
  List items = [];
  List topSelling = [];
  List surprises = [];

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        myServices.sharedPreferences.setString('delivery_time',
            '${response['surprises']['data'][0]['surprises_delivery_time']}');
        if (response['topSelling']['status'] == "success") {
          topSelling.addAll(response['topSelling']['data']);
        }
        if (response['items']['status'] == "success") {
          items.addAll(response['items']['data']);
        }
        if (response['surprises']['status'] == "success") {
          surprises.addAll(response['surprises']['data']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItemsScreen(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "catId": categoryid,
    });
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    initialData();
    super.onInit();
  }
}

import 'package:e_commerce/controller/pages/search_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/pages/items_data.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsController extends MainSearchCotroller {
  initialData();
  changItems(int val, String catVal);
  getItems(String categoryid);
  goToProductDetails(ItemsModel itemsModel);
  goToFavorite();
}

class ItemsControllerImp extends ItemsController {
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();
  List categories = [];
  List data = [];
  int? selectedCat;
  String? catId;
  String? deliveryTime;

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catId = Get.arguments['catId'];
    deliveryTime = myServices.sharedPreferences.getString('delivery_time');
    getItems(catId!);
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
      categoryid,
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  changItems(val, catVal) {
    selectedCat = val;
    catId = catVal;
    getItems(catId!);
    update();
  }

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed(
      AppRoutes.productDetails,
      arguments: {
        'itemsmodel': itemsModel,
      },
    );
  }

  @override
  goToFavorite() {
    Get.toNamed(AppRoutes.myFavorite);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}

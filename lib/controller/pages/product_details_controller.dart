import 'package:e_commerce/controller/pages/cart_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends CartControllerImp {
  initialData();
  add();
  remove();
  //getCount(String itemsId);
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  int itemsCount = 0;

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    //itemsCount = await getCount(itemsModel.itemsId!.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  // @override
  // getCount(String itemsId) async {
  //   statusRequest = StatusRequest.loading;
  //   var response = await cartData.getCountCart(
  //     myServices.sharedPreferences.getString("id")!,
  //     itemsId,
  //   );
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       int itemsCount = 0;
  //       itemsCount = int.parse(response['data'].toString());
  //       return itemsCount;
  //       // Get.rawSnackbar(title: 'Caution', messageText: const Text('Done!'));
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  // }

  @override
  add() {
    addToCart(itemsModel.itemsId!.toString());
    itemsCount++;
    update();
  }

  @override
  remove() {
    if (itemsCount > 0) {
      removeFromCart(itemsModel.itemsId!.toString());
      itemsCount++;
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}

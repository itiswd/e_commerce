import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/remote/orders/archive_data.dart';
import 'package:e_commerce/data/datasource/remote/pages/rating_data.dart';
import 'package:e_commerce/data/model/pending_model.dart';
import 'package:get/get.dart';

abstract class ArchiveController extends GetxController {
  getData();
  String printOrderStatus(val);
  String printPaymentMethod(val);
  String printOrderType(val);
  refreshOrders();
  rateOrder(String ordersId, double rate, String comment);
}

class ArchiveControllerImp extends ArchiveController {
  ArchiveData archiveData = ArchiveData(Get.find());
  RatingData ratingData = RatingData(Get.find());
  MyServices myServices = Get.find();
  List<PendingModel> data = [];
  late StatusRequest statusRequest;

  @override
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await archiveData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => PendingModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  printOrderStatus(val) {
    if (val == 0) {
      return '122'.tr;
    } else if (val == 1) {
      return '123'.tr;
    } else if (val == 2) {
      return '124'.tr;
    } else if (val == 3) {
      return '125'.tr;
    } else {
      return '126'.tr;
    }
  }

  @override
  printOrderType(val) {
    if (val == 0) {
      return '90'.tr;
    } else {
      return '91'.tr;
    }
  }

  @override
  printPaymentMethod(val) {
    if (val == 0) {
      return '87'.tr;
    } else {
      return '88'.tr;
    }
  }

  @override
  rateOrder(String ordersId, double rate, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await ratingData.getData(
      ordersId,
      rate.toString(),
      comment,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  refreshOrders() {
    getData();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}

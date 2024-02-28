import 'dart:async';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handling_data_controller.dart';
import 'package:e_commerce/data/datasource/remote/orders/details_data.dart';
import 'package:e_commerce/data/model/cart_model.dart';
import 'package:e_commerce/data/model/pending_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData detailsData = OrdersDetailsData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;
  PendingModel? pendingModel;
  final Completer<GoogleMapController> controllerCompleter =
      Completer<GoogleMapController>();
  List<Marker> markers = [];
  double? lat;
  double? long;
  CameraPosition? cameraPosition;

  initialData() {
    if (pendingModel!.ordersType == 0) {
      cameraPosition = CameraPosition(
        target: LatLng(
          pendingModel!.addressLat!,
          pendingModel!.addressLong!,
        ),
        zoom: 14.4746,
      );
      markers.add(
        Marker(
          markerId: const MarkerId('1'),
          position: LatLng(
            pendingModel!.addressLat!,
            pendingModel!.addressLong!,
          ),
        ),
      );
    }
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await detailsData.getData((pendingModel!.ordersId!).toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    pendingModel = Get.arguments['pendingmodel']!;
    initialData();
    getData();
    super.onInit();
  }
}

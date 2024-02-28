import 'dart:async';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  MapType mapType = MapType.normal;
  Position? position;
  final Completer<GoogleMapController> controllerCompleter =
      Completer<GoogleMapController>();
  CameraPosition? kGooglePlex;
  double? lat;
  double? long;
  List<Marker> markers = [];

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('1'), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  setMapType(MapType mapTypee) {
    mapType = mapTypee;
    Get.back(canPop: true);
    update();
  }

  goToAddressDetails() {
    Get.toNamed(
      AppRoutes.addressAddDetails,
      arguments: {
        'lat': lat.toString(),
        'long': long.toString(),
      },
    );
  }

  getCurrentPositionn() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(
        position!.latitude,
        position!.longitude,
      ),
      zoom: 14.4746,
    );
    addMarkers(
      LatLng(
        position!.latitude,
        position!.longitude,
      ),
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentPositionn();
    super.onInit();
  }
}

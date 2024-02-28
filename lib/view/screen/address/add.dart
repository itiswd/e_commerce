import 'package:e_commerce/controller/address/add_controller.dart';
import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends GetView<AddAddressController> {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController addController = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: widgetsPositions() == true ? 0 : 4),
          child: Text(
            '96'.tr,
            style:
                Get.textTheme.headlineMedium!.copyWith(color: AppColor.white),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: '97'.tr,
                titlePadding: const EdgeInsets.only(top: 16),
                middleText: '98'.tr,
                content: null,
                actions: [
                  Column(
                    children: [
                      MapTypee(
                        text: '99'.tr,
                        onPressed: () {
                          addController.setMapType(MapType.normal);
                        },
                      ),
                      MapTypee(
                        text: '100'.tr,
                        onPressed: () {
                          addController.setMapType(MapType.hybrid);
                        },
                      ),
                      MapTypee(
                        text: '101'.tr,
                        onPressed: () {
                          addController.setMapType(MapType.satellite);
                        },
                      ),
                      MapTypee(
                        text: '102'.tr,
                        onPressed: () {
                          addController.setMapType(MapType.terrain);
                        },
                      ),
                    ],
                  )
                ],
              );
            },
            icon: const Icon(
              Icons.more_vert,
              size: 28,
              color: AppColor.white,
            ),
          )
        ],
      ),
      body: GetBuilder<AddAddressController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: controller.kGooglePlex != null
                ? Stack(
                    children: [
                      GoogleMap(
                        mapType: addController.mapType,
                        markers: addController.markers.toSet(),
                        compassEnabled: true,
                        onTap: (latlong) {
                          addController.addMarkers(latlong);
                        },
                        initialCameraPosition: addController.kGooglePlex!,
                        onMapCreated: (GoogleMapController controller) {
                          addController.controllerCompleter
                              .complete(controller);
                        },
                      ),
                      Positioned(
                        bottom: 12,
                        right: 64,
                        left: 64,
                        child: MaterialButton(
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onPressed: () {
                            controller.goToAddressDetails();
                          },
                          color: AppColor.primaryColor,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: widgetsPositions() == true ? 0 : 4),
                            child: Text(
                              '103'.tr,
                              style: Get.textTheme.displayLarge!.copyWith(
                                color: AppColor.white,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : const SizedBox(),
          );
        },
      ),
    );
  }
}

class MapTypee extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const MapTypee({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: MaterialButton(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        color: AppColor.primaryColor,
        onPressed: onPressed,
        child: SizedBox(
          width: 180,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: widgetsPositions() == true ? 0 : 4),
              child: Text(
                text,
                style: Get.textTheme.displayLarge!.copyWith(
                  color: AppColor.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

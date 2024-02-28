import 'package:e_commerce/controller/address/address_view_controller.dart';
import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: widgetsPositions() == true ? 0 : 4),
          child: Text(
            '95'.tr,
            style: Get.textTheme.headlineLarge!.copyWith(color: AppColor.white),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          Get.toNamed(AppRoutes.addressAdd);
        },
        child: const Icon(
          Icons.add,
          color: AppColor.white,
        ),
      ),
      body: GetBuilder<AddressViewController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return AddressCard(
                  addressViewModel: controller.data[index],
                  onPressed: () {
                    controller.deleteAddress(
                        controller.data[index].addressId!.toString());
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final AddressViewModel addressViewModel;
  final void Function()? onPressed;
  const AddressCard({
    super.key,
    required this.addressViewModel,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppColor.white,
      surfaceTintColor: AppColor.primaryColorLight,
      margin: const EdgeInsets.only(right: 8, left: 8, top: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            addressViewModel.addressName!,
            style: Get.textTheme.displayLarge,
          ),
          subtitle: Text(
            "${addressViewModel.addressCity!}, ${addressViewModel.addressStreet!}",
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.bodyLarge!,
          ),
          leading: const Icon(
            Icons.location_on,
            color: AppColor.orangeAccent,
          ),
          trailing: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.delete,
              color: AppColor.primaryColorDark,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/pages/home_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translated_database.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTargetCategories extends GetView<HomeControllerImp> {
  const CustomTargetCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          itemCount: controller.topSelling.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.topSelling[index]),
              index: index,
              indexValue: controller.topSelling.length - 1,
            );
          },
        ),
      ),
    );
  }
}

class CustomAllCategories extends GetView<HomeControllerImp> {
  const CustomAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.items[index]),
              index: index,
              indexValue: controller.items.length - 1,
            );
          },
        ),
      ),
    );
  }
}

class Items extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  final int index;
  final int indexValue;
  const Items({
    super.key,
    required this.itemsModel,
    required this.index,
    required this.indexValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widgetsPositions() == true
            ? index == indexValue
                ? 16
                : 0
            : 16,
        right: widgetsPositions() == true
            ? 16
            : index == indexValue
                ? 16
                : 0,
      ),
      child: GestureDetector(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: SizedBox(
          height: 160,
          width: 280,
          child: Stack(
            children: [
              //background
              Center(
                child: Container(
                  height: 160,
                  width: 280,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColorLight,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              //image
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: CachedNetworkImage(
                    imageUrl: '${AppLinks.imageItems}/${itemsModel.itemsImage}',
                    height: 120,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: widgetsPositions() == true ? null : 8,
                right: widgetsPositions() == true ? 8 : null,
                child: SizedBox(
                  width: 260,
                  child: Text(
                    translatedDatabase(
                        itemsModel.itemsNameAr!, itemsModel.itemsName!),
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                      height: widgetsPositions() == true ? 1 : 0.8,
                      backgroundColor: AppColor.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_commerce/controller/pages/items_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translated_database.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:e_commerce/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsList extends GetView<ItemsControllerImp> {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: SizedBox(
        height: 34,
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Categories(
                  i: index,
                  categoriesModel:
                      CategoriesModel.fromJson(controller.categories[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories({
    super.key,
    required this.categoriesModel,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Padding(
      padding: EdgeInsets.only(
        left: widgetsPositions() == true
            ? i == 4
                ? 16
                : 0
            : 16,
        right: widgetsPositions() == true
            ? 16
            : i == 4
                ? 16
                : 0,
      ),
      child: GetBuilder<ItemsControllerImp>(
        builder: (controller) {
          return GestureDetector(
            onTap: () {
              controller.changItems(
                i,
                "${categoriesModel.categoriesId!}",
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: controller.selectedCat == i
                    ? const Border(
                        bottom: BorderSide(
                          width: 2,
                          color: AppColor.primaryColor,
                        ),
                      )
                    : null,
              ),
              child: Text(
                translatedDatabase(categoriesModel.categoriesNameAr!,
                    categoriesModel.categoriesName!),
                style: Get.textTheme.headlineLarge!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: controller.selectedCat == i
                      ? AppColor.primaryColor
                      : AppColor.greyDark,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

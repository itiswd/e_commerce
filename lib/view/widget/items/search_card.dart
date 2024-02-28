import 'package:e_commerce/controller/pages/items_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translated_database.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:e_commerce/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchCard extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;
  const SearchCard({
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
                          color: AppColor.primaryColorDark,
                        ),
                      )
                    : null,
              ),
              child: Text(
                translatedDatabase(categoriesModel.categoriesNameAr!,
                    categoriesModel.categoriesName!),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: controller.selectedCat == i
                      ? AppColor.primaryColorDark
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

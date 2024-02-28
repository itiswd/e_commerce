import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/pages/home_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translated_database.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:e_commerce/data/model/categories_model.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesList extends GetView<HomeControllerImp> {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
              i: index,
              categoriesModel: CategoriesModel.fromJson(
                controller.categories[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({
    Key? key,
    required this.categoriesModel,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
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
        child: GestureDetector(
          onTap: () {
            controller.goToItemsScreen(
              controller.categories,
              i!,
              categoriesModel.categoriesId!.toString(),
            );
          },
          child: Column(
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                    color: AppColor.primaryColorLight,
                    borderRadius: BorderRadius.circular(16)),
                child: Align(
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLinks.imageCategories}/${categoriesModel.categoriesImage}",
                    width: 48,
                    height: 48,
                    color: AppColor.primaryColorDark,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                translatedDatabase(categoriesModel.categoriesNameAr!,
                    categoriesModel.categoriesName!),
                style: Get.textTheme.bodyMedium!.copyWith(
                  color: AppColor.black,
                  height: 1,
                ),
              )
            ],
          ),
        ));
  }
}

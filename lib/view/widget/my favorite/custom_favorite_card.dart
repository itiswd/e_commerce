import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/pages/favorite_view_remove.controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translated_database.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/data/model/my_favorite_model.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFavoriteCard extends GetView<FavoriteViewController> {
  final MyFavoriteModel favoriteModel;
  final ItemsModel itemsModel;
  const CustomFavoriteCard({
    super.key,
    required this.favoriteModel,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteViewController());
    return GestureDetector(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        margin: const EdgeInsets.only(top: 12, right: 16, left: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              //product image
              Hero(
                tag: '${favoriteModel.itemsId}',
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLinks.imageItems}/${favoriteModel.itemsImage!}",
                  width: 160,
                ),
              ),
              const SizedBox(height: 20),
              //product name
              Text(
                translatedDatabase(
                    favoriteModel.itemsNameAr!, favoriteModel.itemsName!),
                textAlign: TextAlign.center,
                style: Get.textTheme.displayLarge!.copyWith(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              //product description
              Text(
                translatedDatabase(
                    favoriteModel.itemsDescAr!, favoriteModel.itemsDesc!),
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyLarge!.copyWith(
                  color: AppColor.greyDark,
                  fontSize: 14,
                  height: 1.2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 16),
              //product price and favorite
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Visibility(
                          visible:
                              favoriteModel.itemsDiscount == 0 ? false : true,
                          child: Text(
                            "${favoriteModel.itemsPrice!} \$",
                            textAlign: TextAlign.center,
                            style: Get.textTheme.displayLarge!.copyWith(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColor.orangeAccent,
                              decorationThickness: 2,
                              color: AppColor.orangeAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: -2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${favoriteModel.itemsPrice!} \$",
                          textAlign: TextAlign.center,
                          style: Get.textTheme.displayLarge!.copyWith(
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: -2,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        controller.deleteFromFavorite(
                            favoriteModel.favoriteId!.toString());
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: AppColor.orangeAccent,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

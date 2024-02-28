import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/pages/favorite_controller.dart';
import 'package:e_commerce/controller/pages/offers_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translated_database.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/data/model/offers_model.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOffersCard extends StatelessWidget {
  final OffersModel offersModel;
  final ItemsModel itemsModel;
  const CustomOffersCard({
    super.key,
    required this.offersModel,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    FavoriteController favoriteController = Get.put(FavoriteController());
    return GetBuilder<OffersController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.goToPageProductDetails(itemsModel);
          },
          child: SizedBox(
            child: Stack(
              children: [
                Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  margin: const EdgeInsets.only(top: 12, right: 16, left: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        //product image
                        Hero(
                          tag: '${offersModel.itemsId}',
                          child: CachedNetworkImage(
                            imageUrl:
                                "${AppLinks.imageItems}/${offersModel.itemsImage!}",
                            width: 160,
                          ),
                        ),
                        const SizedBox(height: 20),
                        //product name
                        Text(
                          translatedDatabase(
                              offersModel.itemsNameAr!, offersModel.itemsName!),
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
                              offersModel.itemsDescAr!, offersModel.itemsDesc!),
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
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Visibility(
                                    visible: offersModel.itemsDiscount == 0
                                        ? false
                                        : true,
                                    child: Text(
                                      "${offersModel.itemsPrice!} \$",
                                      textAlign: TextAlign.center,
                                      style:
                                          Get.textTheme.displayLarge!.copyWith(
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
                                    "${offersModel.itemsafterdiscount} \$",
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
                              GetBuilder<FavoriteController>(
                                builder: (controller) {
                                  return IconButton(
                                    onPressed: () {
                                      if (favoriteController.isFavorite[
                                              offersModel.itemsId] ==
                                          1) {
                                        favoriteController.setFavorite(
                                            offersModel.itemsId, 0);
                                        favoriteController.removeFavorite(
                                            offersModel.itemsId!.toString());
                                      } else {
                                        favoriteController.setFavorite(
                                            offersModel.itemsId, 1);
                                        favoriteController.addFavorite(
                                            offersModel.itemsId!.toString());
                                      }
                                    },
                                    icon: Icon(
                                      favoriteController.isFavorite[
                                                  offersModel.itemsId] ==
                                              1
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: AppColor.primaryColor,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: offersModel.itemsDiscount == 0 ? false : true,
                  child: Positioned(
                    top: 32,
                    left: 32,
                    child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/discount.png',
                              width: 48,
                              height: 48,
                              color: AppColor.primaryColor,
                            ),
                            Center(
                              child: Text(
                                "${offersModel.itemsDiscount!}%",
                                style: Get.textTheme.bodyLarge!.copyWith(
                                  color: AppColor.white,
                                  fontSize: 16,
                                  height: 2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

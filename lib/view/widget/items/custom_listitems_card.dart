import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/pages/favorite_controller.dart';
import 'package:e_commerce/controller/pages/items_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translated_database.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemsCard extends StatelessWidget {
  final ItemsModel itemsModel;
  const CustomItemsCard({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController favoriteController = Get.put(FavoriteController());
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.goToProductDetails(itemsModel);
          },
          child: SizedBox(
            child: Stack(
              children: [
                Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(flex: 8),
                        //product image
                        Hero(
                          tag: '${itemsModel.itemsId}',
                          child: CachedNetworkImage(
                            imageUrl:
                                "${AppLinks.imageItems}/${itemsModel.itemsImage!}",
                            height: 160,
                          ),
                        ),
                        const Spacer(flex: 2),
                        //product name
                        Text(
                          translatedDatabase(
                              itemsModel.itemsNameAr!, itemsModel.itemsName!),
                          textAlign: TextAlign.center,
                          style: Get.textTheme.bodyLarge!.copyWith(
                            overflow: itemsModel.itemsName!.length > 16
                                ? TextOverflow.ellipsis
                                : null,
                            color: AppColor.black,
                          ),
                        ),
                        const Spacer(flex: 3),
                        //delivery time
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: widgetsPositions() == true ? 0 : 4),
                              child: Icon(
                                Icons.timer_sharp,
                                size: 22,
                                color: AppColor.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${controller.deliveryTime} ${'63'.tr}',
                              style: Get.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        const Spacer(flex: 2),
                        //product price and favorite
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Visibility(
                                    visible: itemsModel.itemsDiscount == 0
                                        ? false
                                        : true,
                                    child: Text(
                                      "${itemsModel.itemsPrice!} \$",
                                      textAlign: TextAlign.center,
                                      style:
                                          Get.textTheme.displayLarge!.copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: AppColor.orangeAccent,
                                        decorationThickness: 2,
                                        color: AppColor.orangeAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Text("${itemsModel.priceAfterDiscount!} \$",
                                      textAlign: TextAlign.center,
                                      style:
                                          Get.textTheme.displayLarge!.copyWith(
                                        color: AppColor.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        height: 1,
                                      )),
                                ],
                              ),
                              GetBuilder<FavoriteController>(
                                builder: (controller) {
                                  return IconButton(
                                    onPressed: () {
                                      if (favoriteController
                                              .isFavorite[itemsModel.itemsId] ==
                                          1) {
                                        favoriteController.setFavorite(
                                            itemsModel.itemsId, 0);
                                        favoriteController.removeFavorite(
                                            itemsModel.itemsId!.toString());
                                      } else {
                                        favoriteController.setFavorite(
                                            itemsModel.itemsId, 1);
                                        favoriteController.addFavorite(
                                            itemsModel.itemsId!.toString());
                                      }
                                    },
                                    icon: Icon(
                                      controller.isFavorite[
                                                  itemsModel.itemsId] ==
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
                  visible: itemsModel.itemsDiscount == 0 ? false : true,
                  child: Positioned(
                    top: 16,
                    left: 16,
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/discount.png',
                              width: 40,
                              height: 40,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: widgetsPositions() == true ? 0 : 4,
                              ),
                              child: Text(
                                "${itemsModel.itemsDiscount!}%",
                                style: Get.textTheme.bodyMedium!.copyWith(
                                  color: AppColor.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

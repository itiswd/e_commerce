import 'package:e_commerce/controller/pages/favorite_controller.dart';
import 'package:e_commerce/controller/pages/homescreen_controller.dart';
import 'package:e_commerce/controller/pages/offers_controller.dart';
import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/widget/home/custom_searchbar.dart';
import 'package:e_commerce/view/widget/items/offers/custom_list_offeritems.dart';
import 'package:e_commerce/view/widget/items/search_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<OffersController>(() => OffersController());
    Get.lazyPut<FavoriteController>(() => FavoriteController());
    HomeScreenControllerImp homeController = Get.find();
    return GetBuilder<OffersController>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(Get.width, 80),
              child: CustomSearchBar(
                controller: controller.search!,
                hint: "51".tr,
                onTapFavorite: () {
                  homeController.changePage(3);
                },
                onTapNotify: () {
                  Get.toNamed(AppRoutes.notifications);
                },
                onTapSearchIcon: () {
                  controller.onSearch();
                },
                onChange: (value) {
                  controller.checkSearch(value);
                },
                onFieldSubmitted: (value) {
                  controller.onSearch();
                },
                favExist: true,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: GetBuilder<OffersController>(
                    builder: (controller) {
                      return HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: !controller.isSearch
                            ? ListView.builder(
                                itemCount: controller.data.length,
                                itemBuilder: (context, index) {
                                  final favoriteController =
                                      Get.find<FavoriteController>();
                                  final offersController =
                                      Get.find<OffersController>();
                                  favoriteController.isFavorite[offersController
                                          .data[index].itemsId] =
                                      offersController.data[index].favorite;
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            index == controller.data.length - 1
                                                ? 88
                                                : 0),
                                    child: CustomOffersCard(
                                      itemsModel: controller.itemsData[index],
                                      offersModel: controller.data[index],
                                    ),
                                  );
                                },
                              )
                            : HandlingDataView(
                                statusRequest: controller.statusRequest,
                                widget: SearchList(
                                  searchData: controller.searchData,
                                ),
                              ),
                      );
                    },
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

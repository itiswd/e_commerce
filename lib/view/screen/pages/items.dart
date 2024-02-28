import 'package:e_commerce/controller/pages/favorite_controller.dart';
import 'package:e_commerce/controller/pages/homescreen_controller.dart';
import 'package:e_commerce/controller/pages/items_controller.dart';
import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/view/widget/home/custom_searchbar.dart';
import 'package:e_commerce/view/widget/items/custom_listitems_card.dart';
import 'package:e_commerce/view/widget/items/items_list.dart';
import 'package:e_commerce/view/widget/items/search_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp itemsControllerImp = Get.put(ItemsControllerImp());
    FavoriteController favoriteController = Get.put(FavoriteController());
    HomeScreenControllerImp homeController = Get.find();
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.backgroundColor,
          //search bar
          appBar: PreferredSize(
            preferredSize: Size(Get.width, 80),
            child: CustomSearchBar(
              controller: itemsControllerImp.search!,
              hint: "51".tr,
              onTapFavorite: () {
                Get.back();
                homeController.changePage(3);
              },
              onTapNotify: () {
                Get.toNamed(AppRoutes.notifications);
              },
              onTapSearchIcon: () {
                itemsControllerImp.onSearch();
              },
              onChange: (value) {
                itemsControllerImp.checkSearch(value);
              },
              favExist: true,
            ),
          ),
          body: !itemsControllerImp.isSearch
              ? ListView(
                  children: [
                    const ItemsList(),
                    HandlingDataView(
                      statusRequest: itemsControllerImp.statusRequest,
                      widget: GridView.builder(
                        shrinkWrap: true,
                        itemCount: itemsControllerImp.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                        ),
                        itemBuilder: (context, index) {
                          favoriteController.isFavorite[
                                  itemsControllerImp.data[index]['items_id']] =
                              itemsControllerImp.data[index]['favorite'];
                          return Padding(
                            padding: EdgeInsets.only(
                              left: index % 2 == 0 ? 4 : 0,
                              right: index % 2 == 0 ? 0 : 4,
                            ),
                            child: CustomItemsCard(
                              itemsModel: ItemsModel.fromJson(
                                itemsControllerImp.data[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              : HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: SearchList(
                    searchData: itemsControllerImp.searchData,
                  ),
                ),
        );
      },
    );
  }
}

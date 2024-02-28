import 'package:e_commerce/controller/pages/favorite_controller.dart';
import 'package:e_commerce/controller/pages/favorite_view_remove.controller.dart';
import 'package:e_commerce/controller/pages/homescreen_controller.dart';
import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/view/widget/home/custom_searchbar.dart';
import 'package:e_commerce/view/widget/items/search_list.dart';
import 'package:e_commerce/view/widget/my%20favorite/custom_favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<FavoriteController>(() => FavoriteController());
    Get.lazyPut<FavoriteViewController>(() => FavoriteViewController());
    HomeScreenControllerImp homeController = Get.find();
    return GetBuilder<FavoriteViewController>(
      builder: (controller) {
        return Scaffold(
          //search bar
          appBar: PreferredSize(
            preferredSize: Size(Get.width, 80),
            child: CustomSearchBar(
              controller: controller.search!,
              hint: "51".tr,
              onTapFavorite: () {
                homeController.changePage(3);
              },
              onTapNotify: () {},
              onTapSearchIcon: () {
                controller.onSearch();
              },
              onChange: (value) {
                controller.checkSearch(value);
              },
              favExist: false,
            ),
          ),
          body: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: !controller.isSearch
                ? ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index % 2 == 0 ? 4 : 0,
                          right: index % 2 == 0 ? 0 : 4,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  index == controller.data.length - 1 ? 88 : 0),
                          child: CustomFavoriteCard(
                            itemsModel: controller.itemsData[index],
                            favoriteModel: controller.data[index],
                          ),
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
          ),
        );
      },
    );
  }
}

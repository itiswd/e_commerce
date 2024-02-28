import 'package:e_commerce/controller/pages/home_controller.dart';
import 'package:e_commerce/controller/pages/homescreen_controller.dart';
import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/widget/home/categories_list.dart';
import 'package:e_commerce/view/widget/home/custom_discount_card.dart';
import 'package:e_commerce/view/widget/home/custom_searchbar.dart';
import 'package:e_commerce/view/widget/home/custom_title.dart';
import 'package:e_commerce/view/widget/home/target_categories_list.dart';
import 'package:e_commerce/view/widget/items/search_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    HomeScreenControllerImp homeController = Get.find();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColor.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return Scaffold(
        // search bar
        appBar: PreferredSize(
          preferredSize: Size(Get.width, 80),
          child: CustomSearchBar(
            controller: controller.search!,
            hint: "51".tr,
            onTapNotify: () {
              Get.toNamed(AppRoutes.notifications);
            },
            onTapFavorite: () {
              homeController.changePage(3);
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
        body: HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: !controller.isSearch
              ? ListView(
                  children: [
                    //suerprises
                    const CustomDiscount(),
                    //categories title
                    CustomTitle(title: "54".tr),
                    //categories
                    const CategoriesList(),
                    //top selling title
                    if (controller.topSelling.isNotEmpty)
                      CustomTitle(title: "55".tr),
                    //top selling
                    if (controller.topSelling.isNotEmpty)
                      const CustomTargetCategories(),
                    //all items title
                    CustomTitle(title: "62".tr),
                    //all items
                    const CustomAllCategories(),
                    //bottom space
                    const SizedBox(height: 88),
                  ],
                )
              : HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: SearchList(
                    searchData: controller.searchData,
                  ),
                ),
        ),
      );
    });
  }
}

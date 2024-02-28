import 'dart:io';
import 'package:e_commerce/controller/pages/homescreen_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/widget/home/custom_button_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Visibility(
            visible: controller.page == 4 ? false : true,
            child: SizedBox(
              height: 80,
              child: Card(
                elevation: 4,
                shadowColor: AppColor.black,
                margin: const EdgeInsets.all(0),
                color: AppColor.white,
                surfaceTintColor: AppColor.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //home
                    CustomButtonAppbar(
                      title: "57".tr,
                      icon: Icons.home,
                      onTap: () {
                        controller.changePage(0);
                      },
                      pageNum: 0,
                    ),
                    //settings
                    CustomButtonAppbar(
                      title: "58".tr,
                      icon: Icons.settings,
                      onTap: () {
                        controller.changePage(1);
                      },
                      pageNum: 1,
                    ),
                    const SizedBox(width: 8),
                    //cart
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.myCart);
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColor.primaryColor,
                        radius: 28,
                        child: Icon(
                          Icons.shopping_basket_outlined,
                          size: 28,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    //offers
                    CustomButtonAppbar(
                      title: "59".tr,
                      icon: Icons.offline_bolt_outlined,
                      onTap: () {
                        controller.changePage(2);
                      },
                      pageNum: 2,
                    ),
                    //favorite
                    CustomButtonAppbar(
                      title: "60".tr,
                      icon: Icons.favorite,
                      onTap: () {
                        controller.changePage(3);
                      },
                      pageNum: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: AppColor.white,
          body: WillPopScope(
            child: controller.pageList.elementAt(controller.page),
            onWillPop: () {
              Get.defaultDialog(
                  title: '147'.tr,
                  middleText: '48'.tr,
                  onCancel: () {},
                  onConfirm: () {
                    exit(0);
                  },
                  titleStyle: Get.textTheme.displayLarge!.copyWith(
                    color: AppColor.primaryColorDark,
                  ),
                  middleTextStyle: Get.textTheme.bodyMedium!.copyWith(
                    color: AppColor.black,
                  ),
                  textCancel: '177'.tr,
                  textConfirm: '178'.tr,
                  buttonColor: AppColor.primaryColor,
                  contentPadding: const EdgeInsets.only(bottom: 8));
              return Future.value(false);
            },
          ),
        );
      },
    );
  }
}

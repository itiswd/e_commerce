import 'package:e_commerce/controller/pages/cart_controller.dart';
import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translated_database.dart';
import 'package:e_commerce/view/widget/cart/card_bottom_navigation.dart';
import 'package:e_commerce/view/widget/cart/cart_appbar.dart';
import 'package:e_commerce/view/widget/cart/cart_main_card.dart';
import 'package:e_commerce/view/widget/cart/total_item_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColor.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
    CartControllerImp cartController = Get.put(CartControllerImp());
    return Scaffold(
      body: Column(
        children: [
          //app bar
          GetBuilder<CartControllerImp>(
            builder: (controller) {
              return const CartAppbar();
            },
          ),
          //items
          Expanded(
            child: GetBuilder<CartControllerImp>(
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: cartController.statusRequest,
                  widget: Column(
                    children: [
                      TotalItemRow(
                        totalCount: cartController.totalItemsCount,
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.only(top: 8),
                          children: [
                            ...List.generate(
                              cartController.data.length,
                              (index) => CartMainCard(
                                imageName: cartController
                                    .data[index].itemsImage!
                                    .toString(),
                                name: translatedDatabase(
                                  cartController.data[index].itemsNameAr!,
                                  cartController.data[index].itemsName!,
                                ),
                                price:
                                    '${cartController.data[index].itemsPrice! - cartController.data[index].itemsPrice! * cartController.data[index].itemsDiscount! ~/ 100}\$',
                                count:
                                    '${cartController.data[index].countitems}',
                                onAdd: () async {
                                  await cartController.addToCart(cartController
                                      .data[index].itemsId!
                                      .toString());
                                  cartController.refreshPage();
                                },
                                onRemove: () async {
                                  await cartController.removeFromCart(
                                      cartController.data[index].itemsId!
                                          .toString());
                                  cartController.refreshPage();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      CartBottomNavigation(
                        totalItemsPrice: cartController.priceAfterCoupon(),
                        couponController: cartController.couponCont!,
                        shipping: cartController.totalItemsCount == 0 ? 0 : 20,
                        discount: cartController.couponDicount!,
                        onApply: () {
                          cartController.checkCoupon();
                        },
                        onOrder: () {
                          controller.goToCheckOut();
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

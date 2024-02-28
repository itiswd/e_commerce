import 'package:e_commerce/controller/pages/product_details_controller.dart';
import 'package:e_commerce/core/class/handlingdata.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/translated_database.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:e_commerce/view/widget/product%20details/count_and_price.dart';
import 'package:e_commerce/view/widget/product%20details/product_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 64,
        surfaceTintColor: AppColor.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: MaterialButton(
            color: AppColor.primaryColorDark,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () {
              Get.offAndToNamed(AppRoutes.myCart);
            },
            child: Padding(
              padding: EdgeInsets.only(top: widgetsPositions() == true ? 0 : 4),
              child: Text(
                '71'.tr,
                style: Get.textTheme.displayLarge!.copyWith(
                  height: 1,
                  fontSize: 18,
                  color: AppColor.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                //product image
                ProductImage(
                  link:
                      "${AppLinks.imageItems}/${controller.itemsModel.itemsImage!}",
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(height: Get.width / 12),
                      //product name
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          '${translatedDatabase(controller.itemsModel.itemsNameAr!, controller.itemsModel.itemsName!)}',
                          style: Get.textTheme.displayLarge,
                        ),
                      ),
                      SizedBox(height: Get.width / 16),
                      //product count and price
                      CountAndPrice(
                        onAdd: () {
                          controller.add();
                        },
                        onRemove: () {
                          controller.remove();
                        },
                        count: '${controller.itemsCount}',
                        visible: controller.itemsModel.itemsDiscount == 0
                            ? false
                            : true,
                        price: '${controller.itemsModel.itemsPrice}',
                        priceAfter:
                            '${controller.itemsModel.priceAfterDiscount}',
                      ),
                      SizedBox(height: Get.width / 32),
                      //product description
                      Padding(
                        padding: EdgeInsets.only(
                          left: widgetsPositions() == true ? 40 : 24,
                          right: widgetsPositions() == true ? 24 : 40,
                        ),
                        child: Text(
                          '${translatedDatabase(controller.itemsModel.itemsDescAr!, controller.itemsModel.itemsDesc!)}.',
                          style: Get.textTheme.bodyLarge!.copyWith(
                            height: 1.33,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

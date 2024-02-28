import 'package:e_commerce/controller/pages/home_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translated_database.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/view/widget/cart/product_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchList extends StatelessWidget {
  final List<ItemsModel> searchData;
  const SearchList({super.key, required this.searchData});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return ListView.builder(
      itemCount: searchData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            controller.goToPageProductDetails(searchData[index]);
          },
          child: Card(
            color: AppColor.white,
            surfaceTintColor: AppColor.white,
            margin: const EdgeInsets.only(right: 8, left: 8, top: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                //product image
                CartProductImage(imageName: searchData[index].itemsImage!),
                const SizedBox(width: 8),
                //name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translatedDatabase(searchData[index].itemsNameAr!,
                          searchData[index].itemsName!),
                      style: Get.textTheme.displayLarge!.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${searchData[index].itemsPrice!}\$",
                      style: Get.textTheme.displayLarge!.copyWith(
                        color: AppColor.orangeAccent,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

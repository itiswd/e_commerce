import 'package:e_commerce/controller/pages/home_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translated_database.dart';
import 'package:e_commerce/core/functions/widgets_positions.dart';
import 'package:e_commerce/data/model/surprises_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDiscount extends GetView<HomeControllerImp> {
  const CustomDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDiscountCard(
      surprisesModel: SurprisesModel.fromJson(controller.surprises[0]),
    );
  }
}

class CustomDiscountCard extends StatelessWidget {
  final SurprisesModel surprisesModel;
  const CustomDiscountCard({
    super.key,
    required this.surprisesModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 160,
          child: Stack(
            children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Positioned(
                top: -32,
                right: widgetsPositions() == true ? null : -32,
                left: widgetsPositions() == true ? -32 : null,
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColorDark,
                    borderRadius: BorderRadius.circular(160),
                  ),
                ),
              ),
              Center(
                child: ListTile(
                  title: Text(
                    translatedDatabase(surprisesModel.surprisesTitleAr!,
                        surprisesModel.surprisesTitle!),
                    style: Get.textTheme.displayLarge!.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                  subtitle: Text(
                    translatedDatabase(surprisesModel.surprisesBodyAr!,
                        surprisesModel.surprisesBody!),
                    style: Get.textTheme.headlineLarge!.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

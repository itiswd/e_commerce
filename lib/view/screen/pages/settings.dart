import 'package:e_commerce/controller/pages/settengs_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/widget/settings/custom_main_card.dart';
import 'package:e_commerce/view/widget/settings/settings_user_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MySettengs extends StatelessWidget {
  const MySettengs({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColor.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Column(
        children: [
          //const ImageAndBack(),
          UserName(
            text:
                controller.myServices.sharedPreferences.getString('username')!,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 8),
              children: [
                //orders
                CustomMainCard(
                  text: '65'.tr,
                  icon: Icons.shopify_sharp,
                  onTap: () {
                    Get.toNamed(AppRoutes.pendingOrders);
                  },
                ),
                //archive
                CustomMainCard(
                  text: '66'.tr,
                  icon: Icons.archive_outlined,
                  onTap: () {
                    Get.toNamed(AppRoutes.ordersArchive);
                  },
                ),
                //address
                CustomMainCard(
                  text: '67'.tr,
                  icon: Icons.location_on_outlined,
                  onTap: () {
                    Get.toNamed(AppRoutes.addressView);
                  },
                ),
                //about us
                CustomMainCard(
                  text: '68'.tr,
                  icon: Icons.help_outline_rounded,
                  onTap: () {
                    Get.toNamed(AppRoutes.aboutUs);
                  },
                ),
                //contact us
                CustomMainCard(
                  text: '69'.tr,
                  icon: Icons.phone_callback_outlined,
                  onTap: () {
                    controller.contactUs(
                      'https://api.whatsapp.com/send?phone=2001553889243&text=%D8%A7%D9%84%D8%B3%D9%84%D8%A7%D9%85%20%D8%B9%D9%84%D9%8A%D9%83%D9%85%D8%8C%20%20%D9%83%D9%8A%D9%81%20%D8%A7%D9%84%D8%AD%D8%A7%D9%84!%20',
                      LaunchMode.externalApplication,
                    );
                  },
                ),
                // //language
                // CustomMainCard(
                //   text: '176'.tr,
                //   icon: Icons.language,
                //   onTap: () {
                //     Get.offAllNamed(AppRoutes.language);
                //   },
                // ),
                //log out
                CustomMainCard(
                  text: '70'.tr,
                  icon: Icons.exit_to_app,
                  onTap: () {
                    controller.logOut();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

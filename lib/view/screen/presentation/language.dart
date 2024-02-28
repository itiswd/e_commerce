import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/localization/changelocal.dart';
import 'package:e_commerce/main.dart';
import 'package:e_commerce/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocaleController());
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColor.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: GetBuilder<LocaleController>(
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 48,
                  child: Text(
                    '1'.tr,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                CustomButtonLang(
                  textButton: '39'.tr,
                  onPressed: () async {
                    controller.changeLang('ar');
                    await mainprefs.setString('id', 'onBoarding');
                    Get.toNamed(AppRoutes.onBoarding);
                  },
                ),
                CustomButtonLang(
                  textButton: '40'.tr,
                  onPressed: () async {
                    controller.changeLang('en');
                    await mainprefs.setString('id', 'onBoarding');
                    Get.toNamed(AppRoutes.onBoarding);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

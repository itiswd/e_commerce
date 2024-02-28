import 'package:e_commerce/view/screen/pages/home.dart';
import 'package:e_commerce/view/screen/pages/my_favorite.dart';
import 'package:e_commerce/view/screen/pages/offers.dart';
import 'package:e_commerce/view/screen/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  List<Widget> pageList = [
    const HomePage(),
    const MySettengs(),
    const OffersPage(),
    const MyFavorite(),
  ];

  int page = 0;

  @override
  changePage(int currentPage) {
    page = currentPage;
    update();
  }
}

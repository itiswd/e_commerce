import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/screen/address/add.dart';
import 'package:e_commerce/view/screen/address/adress_details.dart';
import 'package:e_commerce/view/screen/address/view.dart';
import 'package:e_commerce/view/screen/forgetpassword/forgot_password.dart';
import 'package:e_commerce/view/screen/auth/login.dart';
import 'package:e_commerce/view/screen/forgetpassword/reset_password.dart';
import 'package:e_commerce/view/screen/auth/signup.dart';
import 'package:e_commerce/view/screen/forgetpassword/success_reset_password.dart';
import 'package:e_commerce/view/screen/auth/success_sign_up.dart';
import 'package:e_commerce/view/screen/forgetpassword/verify_code.dart';
import 'package:e_commerce/view/screen/auth/verify_code_signup.dart';
import 'package:e_commerce/view/screen/orders/archive.dart';
import 'package:e_commerce/view/screen/orders/order_details.dart';
import 'package:e_commerce/view/screen/orders/pending.dart';
import 'package:e_commerce/view/screen/pages/about_us.dart';
import 'package:e_commerce/view/screen/pages/cart.dart';
import 'package:e_commerce/view/screen/pages/check_out.dart';
import 'package:e_commerce/view/screen/pages/homescreen.dart';
import 'package:e_commerce/view/screen/pages/items.dart';
import 'package:e_commerce/view/screen/pages/my_favorite.dart';
import 'package:e_commerce/view/screen/pages/notifications.dart';
import 'package:e_commerce/view/screen/pages/product_datails.dart';
import 'package:e_commerce/view/screen/presentation/language.dart';
import 'package:e_commerce/view/screen/presentation/onboarding.dart';
import 'package:get/get.dart';

import 'core/middleware/my_middleware.dart';

List<GetPage<dynamic>>? routes = [
  //Initial
  GetPage(
    name: '/',
    page: () => const Language(),
    middlewares: [
      MyMiddleWare(),
    ],
  ),

  //OnBoarding
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => const OnBoarding(),
  ),
  //Language
  GetPage(
    name: AppRoutes.language,
    page: () => const Language(),
  ),
  //Auth
  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRoutes.signUp,
    page: () => const SignUp(),
  ),
  GetPage(
    name: AppRoutes.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoutes.verifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRoutes.verifyCodeSignUp,
    page: () => const VerifyCodeSignUp(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoutes.successSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),

  //Notifications
  GetPage(
    name: AppRoutes.notifications,
    page: () => const Notifications(),
  ),

  //Screens
  GetPage(
    name: AppRoutes.home,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.items,
    page: () => const ItemsScreen(),
  ),
  GetPage(
    name: AppRoutes.productDetails,
    page: () => const ProductDetails(),
  ),
  GetPage(
    name: AppRoutes.myFavorite,
    page: () => const MyFavorite(),
  ),
  GetPage(
    name: AppRoutes.myCart,
    page: () => const Cart(),
  ),
  GetPage(
    name: AppRoutes.addressView,
    page: () => const AddressView(),
  ),
  GetPage(
    name: AppRoutes.addressAdd,
    page: () => const AddressAdd(),
  ),
  GetPage(
    name: AppRoutes.addressAddDetails,
    page: () => const AddressDetails(),
  ),
  GetPage(
    name: AppRoutes.checkOut,
    page: () => const CheckOut(),
  ),
  GetPage(
    name: AppRoutes.pendingOrders,
    page: () => const PendingOrders(),
  ),
  GetPage(
    name: AppRoutes.ordersArchive,
    page: () => const OrdersArchive(),
  ),
  GetPage(
    name: AppRoutes.ordersDetails,
    page: () => const OrderDetails(),
  ),
  GetPage(
    name: AppRoutes.aboutUs,
    page: () => const AboutUs(),
  ),
];

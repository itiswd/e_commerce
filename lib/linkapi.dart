class AppLinks {
  //main server
  static const String server = "http://192.168.1.3/ecommerce01";
  // static const String server = "http://10.0.2.2/ecommerce01";
  //notification
  static const String notifications = "$server/notifications.php";
  //image
  static const String imageStatic = "http://192.168.1.3/ecommerce01/upload";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";
  //test
  static const String test = "$server/test.php";
  //auth
  static const String signUp = "$server/auth/signup.php";
  static const String verifyCodeSignUp = "$server/auth/verifycode.php";
  static const String logIn = "$server/auth/login.php";
  static const String resendVerCode = "$server/auth/resend_verify_code.php";
  //forget password
  static const String checkEmail = "$server/forget password/check_email.php";
  static const String verifycodeForgetPassword =
      "$server/forget password/verifycode.php";
  static const String resetPassword =
      "$server/forget password/reset_password.php";
  //home
  static const String homePage = "$server/home.php";
  //items
  static const String items = "$server/items/items.php";
  static const String search = "$server/items/search.php";
  //favorite
  static const String addToFavorite = "$server/favorite/add.php";
  static const String removeFromFavorite = "$server/favorite/remove.php";
  static const String viewFavorite = "$server/favorite/view.php";
  static const String deleteFromFavorite =
      "$server/favorite/delete_from_favorite.php";
  //cart
  static const String viewCart = "$server/cart/view.php";
  static const String addCart = "$server/cart/add.php";
  static const String removeCart = "$server/cart/remove.php";
  static const String getCountCart = "$server/cart/getcount.php";
  //address
  static const String viewAddress = "$server/address/view.php";
  static const String addAddress = "$server/address/add.php";
  static const String editAddress = "$server/address/edit.php";
  static const String deleteAddress = "$server/address/delete.php";
  //coupon
  static const String checkCoupon = "$server/coupon/check_coupon.php";
  //checkout
  static const String checkout = "$server/orders/checkout.php";
  static const String pending = "$server/orders/pending.php";
  static const String archive = "$server/orders/archive.php";
  static const String details = "$server/orders/details.php";
  static const String deleteOrder = "$server/orders/delete.php";
  //offers
  static const String offers = "$server/offers.php";
  //rating
  static const String rating = "$server/rating.php";
}

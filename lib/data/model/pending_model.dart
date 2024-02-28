class PendingModel {
  int? ordersId;
  int? ordersUsersId;
  int? ordersAddress;
  int? ordersType;
  int? ordersDeliveryPrice;
  int? ordersPrice;
  int? ordersCoupon;
  int? ordersRating;
  String? ordersRatingNote;
  int? ordersPaymentMethod;
  int? ordersStatus;
  int? ordersTotalPrice;
  String? ordersDatetime;
  int? addressId;
  int? addressUsersId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  PendingModel(
      {this.ordersId,
      this.ordersUsersId,
      this.ordersAddress,
      this.ordersType,
      this.ordersDeliveryPrice,
      this.ordersPrice,
      this.ordersCoupon,
      this.ordersRating,
      this.ordersRatingNote,
      this.ordersPaymentMethod,
      this.ordersStatus,
      this.ordersTotalPrice,
      this.ordersDatetime,
      this.addressId,
      this.addressUsersId,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  PendingModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersId = json['orders_users_id'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersDeliveryPrice = json['orders_delivery_price'];
    ordersPrice = json['orders_price'];
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersRatingNote = json['orders_rating_note'];
    ordersPaymentMethod = json['orders_payment_method'];
    ordersStatus = json['orders_status'];
    ordersTotalPrice = json['orders_total_price'];
    ordersDatetime = json['orders_datetime'];
    addressId = json['address_id'];
    addressUsersId = json['address_users_id'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_users_id'] = ordersUsersId;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_delivery_price'] = ordersDeliveryPrice;
    data['orders_price'] = ordersPrice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_rating'] = ordersRating;
    data['orders_rating_note'] = ordersRatingNote;
    data['orders_payment_method'] = ordersPaymentMethod;
    data['orders_status'] = ordersStatus;
    data['orders_total_price'] = ordersTotalPrice;
    data['orders_datetime'] = ordersDatetime;
    data['address_id'] = addressId;
    data['address_users_id'] = addressUsersId;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}

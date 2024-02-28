class CouponModel {
  int? couponId;
  String? couponName;
  int? couponCount;
  String? couponExpiredDate;
  int? couponDiscount;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponExpiredDate,
      this.couponDiscount});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponExpiredDate = json['coupon_expired_date'];
    couponDiscount = json['coupon_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coupon_id'] = couponId;
    data['coupon_name'] = couponName;
    data['coupon_count'] = couponCount;
    data['coupon_expired_date'] = couponExpiredDate;
    data['coupon_discount'] = couponDiscount;
    return data;
  }
}

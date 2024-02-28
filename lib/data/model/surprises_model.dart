class SurprisesModel {
  int? surprisesId;
  String? surprisesTitle;
  String? surprisesTitleAr;
  String? surprisesBody;
  String? surprisesBodyAr;
  int? surprisesDeliveryTime;

  SurprisesModel(
      {this.surprisesId,
      this.surprisesTitle,
      this.surprisesTitleAr,
      this.surprisesBody,
      this.surprisesBodyAr,
      this.surprisesDeliveryTime});

  SurprisesModel.fromJson(Map<String, dynamic> json) {
    surprisesId = json['surprises_id'];
    surprisesTitle = json['surprises_title'];
    surprisesTitleAr = json['surprises_title_ar'];
    surprisesBody = json['surprises_body'];
    surprisesBodyAr = json['surprises_body_ar'];
    surprisesDeliveryTime = json['surprises_delivery_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['surprises_id'] = surprisesId;
    data['surprises_title'] = surprisesTitle;
    data['surprises_title_ar'] = surprisesTitleAr;
    data['surprises_body'] = surprisesBody;
    data['surprises_body_ar'] = surprisesBodyAr;
    data['surprises_delivery_time'] = surprisesDeliveryTime;
    return data;
  }
}

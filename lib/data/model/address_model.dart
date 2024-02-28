class AddressViewModel {
  int? addressId;
  String? addressName;
  int? addressUsersId;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  AddressViewModel(
      {this.addressId,
      this.addressName,
      this.addressUsersId,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  AddressViewModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressUsersId = json['address_users_id'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'].toDouble();
    addressLong = json['address_long'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['address_name'] = addressName;
    data['address_users_id'] = addressUsersId;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}

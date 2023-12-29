class CustomerModel {
  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? address;
  String? loan;

  CustomerModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.address,
      this.loan});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    address = json['address'];
    loan = json['loan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['loan'] = this.loan;
    return data;
  }
}

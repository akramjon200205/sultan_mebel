class CustomerModel {
  int? id;
  String? loan;
  String? firstName;
  String? lastName;
  String? phone;
  String? address;

  CustomerModel(
      {this.id,
      this.loan,
      this.firstName,
      this.lastName,
      this.phone,
      this.address});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loan = json['loan'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['loan'] = this.loan;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['address'] = this.address;
    return data;
  }
}

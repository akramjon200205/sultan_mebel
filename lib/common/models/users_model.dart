class UsersModel {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  String? patronymic;
  String? phone;
  String? address;
  bool? isActive;

  UsersModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.username,
      this.patronymic,
      this.phone,
      this.address,
      this.isActive});

  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    patronymic = json['patronymic'];
    phone = json['phone'];
    address = json['address'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['patronymic'] = this.patronymic;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['is_active'] = this.isActive;
    return data;
  }
}

class BranchModel {
  int? id;
  String? name;
  String? adress;
  String? phone;

  BranchModel({this.id, this.name, this.adress, this.phone});

  BranchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    adress = json['adress'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['adress'] = this.adress;
    data['phone'] = this.phone;
    return data;
  }
}

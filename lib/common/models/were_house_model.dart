class WerehouseModel {
  int? id;
  Branch? branch;

  WerehouseModel({this.id, this.branch});

  WerehouseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branch =
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    return data;
  }
}

class Branch {
  int? id;
  String? name;
  String? adress;
  String? phone;

  Branch({this.id, this.name, this.adress, this.phone});

  Branch.fromJson(Map<String, dynamic> json) {
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

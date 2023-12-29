class WereHouseModel {
  int? id;
  List<Items>? items;
  int? branch;

  WereHouseModel({this.id, this.items, this.branch});

  WereHouseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['branch'] = this.branch;
    return data;
  }
}

class Items {
  int? id;
  int? amount;
  int? warehouse;
  int? product;

  Items({this.id, this.amount, this.warehouse, this.product});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    warehouse = json['warehouse'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['warehouse'] = this.warehouse;
    data['product'] = this.product;
    return data;
  }
}

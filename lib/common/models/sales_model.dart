class SalesModel {
  int? id;
  List<Items>? items;
  String? datetime;
  String? price;
  String? comment;
  int? user;
  int? customer;
  int? branch;

  SalesModel(
      {this.id,
      this.items,
      this.datetime,
      this.price,
      this.comment,
      this.user,
      this.customer,
      this.branch});

  SalesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    datetime = json['datetime'];
    price = json['price'];
    comment = json['comment'];
    user = json['user'];
    customer = json['customer'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['datetime'] = this.datetime;
    data['price'] = this.price;
    data['comment'] = this.comment;
    data['user'] = this.user;
    data['customer'] = this.customer;
    data['branch'] = this.branch;
    return data;
  }
}

class Items {
  int? id;
  int? amount;
  int? product;
  int? sale;

  Items({this.id, this.amount, this.product, this.sale});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    product = json['product'];
    sale = json['sale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['product'] = this.product;
    data['sale'] = this.sale;
    return data;
  }
}

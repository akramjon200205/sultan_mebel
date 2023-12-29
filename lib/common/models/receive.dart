class ReceiveModel {
  int? id;
  int? branch;
  int? user;
  String? comment;
  String? datetime;
  List<Items>? items;

  ReceiveModel(
      {this.id,
      this.branch,
      this.user,
      this.comment,
      this.datetime,
      this.items});

  ReceiveModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branch = json['branch'];
    user = json['user'];
    comment = json['comment'];
    datetime = json['datetime'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch'] = this.branch;
    data['user'] = this.user;
    data['comment'] = this.comment;
    data['datetime'] = this.datetime;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  int? amount;
  int? product;
  int? receive;

  Items({this.id, this.amount, this.product, this.receive});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    product = json['product'];
    receive = json['receive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['product'] = this.product;
    data['receive'] = this.receive;
    return data;
  }
}

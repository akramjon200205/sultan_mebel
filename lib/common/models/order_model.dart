class OrderModel {
  int? id;
  List<OrderImages>? orderImages;
  String? date;
  String? viewDate;
  String? endDate;
  String? price;
  String? comment;
  int? state;
  bool? isNotificated;
  int? customer;
  int? user;
  int? branch;
  int? notification;

  OrderModel(
      {this.id,
      this.orderImages,
      this.date,
      this.viewDate,
      this.endDate,
      this.price,
      this.comment,
      this.state,
      this.isNotificated,
      this.customer,
      this.user,
      this.branch,
      this.notification});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['order_images'] != null) {
      orderImages = <OrderImages>[];
      json['order_images'].forEach((v) {
        orderImages!.add(new OrderImages.fromJson(v));
      });
    }
    date = json['date'];
    viewDate = json['view_date'];
    endDate = json['end_date'];
    price = json['price'];
    comment = json['comment'];
    state = json['state'];
    isNotificated = json['is_notificated'];
    customer = json['customer'];
    user = json['user'];
    branch = json['branch'];
    notification = json['notification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.orderImages != null) {
      data['order_images'] = this.orderImages!.map((v) => v.toJson()).toList();
    }
    data['date'] = this.date;
    data['view_date'] = this.viewDate;
    data['end_date'] = this.endDate;
    data['price'] = this.price;
    data['comment'] = this.comment;
    data['state'] = this.state;
    data['is_notificated'] = this.isNotificated;
    data['customer'] = this.customer;
    data['user'] = this.user;
    data['branch'] = this.branch;
    data['notification'] = this.notification;
    return data;
  }
}

class OrderImages {
  int? id;
  String? img;
  int? order;

  OrderImages({this.id, this.img, this.order});

  OrderImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['order'] = this.order;
    return data;
  }
}

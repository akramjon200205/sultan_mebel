class ScheduledLoans {
  String? price;
  String? date;
  bool? isNotificated;
  int? customer;
  int? notification;

  ScheduledLoans(
      {this.price,
      this.date,
      this.isNotificated,
      this.customer,
      this.notification});

  ScheduledLoans.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    date = json['date'];
    isNotificated = json['is_notificated'];
    customer = json['customer'];
    notification = json['notification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['date'] = this.date;
    data['is_notificated'] = this.isNotificated;
    data['customer'] = this.customer;
    data['notification'] = this.notification;
    return data;
  }
}

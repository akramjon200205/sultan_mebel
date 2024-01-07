class LoanBranch {
  int? id;
  String? date;
  String? price;
  int? customer;
  int? user;
  int? branch;

  LoanBranch(
      {this.id, this.date, this.price, this.customer, this.user, this.branch});

  LoanBranch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    price = json['price'];
    customer = json['customer'];
    user = json['user'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['price'] = this.price;
    data['customer'] = this.customer;
    data['user'] = this.user;
    data['branch'] = this.branch;
    return data;
  }
}

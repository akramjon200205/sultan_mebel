
class Images {
  int? id;
  String? image;
  int? product;

  Images({this.id, this.image, this.product});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['product'] = this.product;
    return data;
  }
}
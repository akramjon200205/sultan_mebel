
import 'package:sultan_mebel/common/models/images.dart';

class Products {
  int? id;
  List<Images>? images;
  String? name;
  int? price;
  String? sizes;
  int? category;

  Products(
      {this.id, this.images, this.name, this.price, this.sizes, this.category});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    name = json['name'];
    price = json['price'];
    sizes = json['sizes'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['price'] = this.price;
    data['sizes'] = this.sizes;
    data['category'] = this.category;
    return data;
  }
}

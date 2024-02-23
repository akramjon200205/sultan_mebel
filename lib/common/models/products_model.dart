import 'package:hive/hive.dart';

part 'products_model.g.dart';

@HiveType(typeId: 0)
class ProductsModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  List<Images>? images;
  @HiveField(2)
  String? name;
  @HiveField(3)
  double? price;
  @HiveField(4)
  String? sizes;
  @HiveField(5)
  int? category;

  ProductsModel({this.id, this.images, this.name, this.price, this.sizes, this.category});

  ProductsModel.fromJson(Map<String, dynamic> json) {
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

class Images {
  int? id;
  int? product;
  int? image;

  Images({this.id, this.product, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product'] = this.product;
    data['image'] = this.image;
    return data;
  }
}

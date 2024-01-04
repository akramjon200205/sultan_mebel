import 'package:sultan_mebel/common/models/products_model.dart';

class CategoryModel {
  int? id;
  List<Products>? products;
  String? name;

  CategoryModel({this.id, this.products, this.name});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    return data;
  }
}

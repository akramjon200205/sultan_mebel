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
        products!.add(new Products.fromJson(v));
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

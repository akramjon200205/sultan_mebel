import '../../../../common/models/products_model.dart';

class WarehouseItemsModel {
  int? id;
  ProductsModel? product;
  int? amount;
  int? warehouse;

  WarehouseItemsModel({this.id, this.product, this.amount, this.warehouse});

  WarehouseItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? new ProductsModel.fromJson(json['product']) : null;
    amount = json['amount'];
    warehouse = json['warehouse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['amount'] = this.amount;
    data['warehouse'] = this.warehouse;
    return data;
  }
}

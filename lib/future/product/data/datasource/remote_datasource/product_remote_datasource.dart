// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:sultan_mebel/common/models/products_model.dart';

abstract class ProductRemoteDatasource {
  Future<ProductsModel> getProduct(int? id);
  Future<ProductsModel> postProduct(
    String? name,
    double? price,
    String? sizes,
    int? category,
    int? id,
  );
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  Dio dio;
  ProductRemoteDatasourceImpl({
    required this.dio,
  });

  @override
  Future<ProductsModel> getProduct(int? id) async {
    final response = await dio.request(
      '/api/v1/products/$id/',
      options: Options(
        method: "GET",
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    var product = ProductsModel.fromJson(response.data);
    return product;
  }

  @override
  Future<ProductsModel> postProduct(String? name, double? price, String? sizes, int? category, int? id) async {
    final response = await dio.request(
      '/api/v1/products/$id/',
      options: Options(
        method: 'PUT',
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
      data: {"name": name, "price": price, "sizes": sizes, "category": category},
    );
    return ProductsModel.fromJson(response.data);
  }
}

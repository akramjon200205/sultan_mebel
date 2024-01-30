// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sultan_mebel/common/models/products_model.dart';
import 'package:sultan_mebel/common/models/shared_model.dart';
import 'package:sultan_mebel/future/products/data/model/warehouse_items_model.dart';

abstract class ProductRemoteDatasource {
  Future<ProductsModel> getProduct(int? id);
  Future<ProductsModel> postProduct(
    String? name,
    double? price,
    String? sizes,
    int? category,
    int? id,
  );
  Future<WarehouseItemsModel> putAmount(
    int? idWarehouse,
    int? amount,
    int? idProductWarehouse,
  );
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  Dio dio;
  ProductRemoteDatasourceImpl({
    required this.dio,
  });
  // final LoginRemoteDataSourceImpl loginRemoteDataSourceImpl;

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
      data: json.encode({"name": name, "price": price, "sizes": sizes, "category": category}),
    );
    return ProductsModel.fromJson(response.data);
  }

  @override
  Future<WarehouseItemsModel> putAmount(int? idWarehouse, int? amount, int? idProduct) async {
    SharedPreferences? sharedPreferences = await SharedPreferences.getInstance();
    log("access: ${sharedPreferences.getString(SharedModel.accessToken)}");
    log("refresh: ${sharedPreferences.getString(SharedModel.refreshToken)}");
    final response = await dio.request(
      '/api/v1/receives/',
      options: Options(
        method: 'POST',
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${sharedPreferences.getString(SharedModel.accessToken)}',
        },
      ),
      data: json.encode({
        "receive_items": [
          {
            'amount': amount,
            'product': idProduct,
          }
        ],
        "comment": "$idWarehouse $idProduct $amount",
        "branch": idWarehouse,
      }),
    );
    return WarehouseItemsModel.fromJson(response.data);
  }
}

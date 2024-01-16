import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sultan_mebel/future/home/data/models/category_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<CategoryModel>> getProducts(int? id);
  Future<Products> postProduct();
}

class ProductRemoteDataSouceImpl extends ProductRemoteDataSource {
  Dio dio;
  ProductRemoteDataSouceImpl({
    required this.dio,
  });
  @override
  Future<List<CategoryModel>> getProducts(int? id) async {
  try {
    final response = await dio.request('/api/v1/categories/$id/',
        options: Options(
          method: 'GET',
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ));

    if (response.data is List) {
      // Case: Response is a List
      var categoryList = (response.data as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
      return categoryList;
    } else if (response.data is Map<String, dynamic>) {
      // Case: Response is a single object (Map)
      var categoryModel = CategoryModel.fromJson(response.data);
      return [categoryModel]; // Wrap the single object in a List
    } else {
      throw Exception("Invalid response format. Expected a List or Map, but received ${response.data.runtimeType}.");
    }
  } catch (e) {
    throw e;
  }
}


  @override
  Future<Products> postProduct() {
    // TODO: implement postProduct
    throw UnimplementedError();
  }
}

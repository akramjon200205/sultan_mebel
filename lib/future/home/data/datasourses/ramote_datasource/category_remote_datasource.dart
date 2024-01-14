// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sultan_mebel/future/home/data/models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<dynamic> categories();
  Future<dynamic> postCategories(String categoryName);
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  Dio dio;
  CategoryRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future categories() async {
    final response = await dio.request(
      '/api/v1/categories/',
      options: Options(
        method: 'GET',
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    var categoryList = (jsonDecode(response.data) as List)
        .map(
          (e) => CategoryModel.fromJson(e),
        )
        .toList();

    return categoryList;
  }

  @override
  Future postCategories(String categoryName) async {
    final response = await dio.request('/api/v1/categories/',
        options: Options(
          method: 'POST',
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: {"name": categoryName});
    return CategoryModel.fromJson(response.data);
  }
}

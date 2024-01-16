// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sultan_mebel/future/home/data/models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> categories();
  Future<CategoryModel> postCategories(String categoryName);
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  Dio dio;
  CategoryRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<List<CategoryModel>> categories() async {
    try {
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

      // Print the response data to understand its structure
      print(response.data);

      // Check if the decoded JSON is a list
      if (response.data is List) {
        var categoryList = (response.data as List).map((e) => CategoryModel.fromJson(e)).toList();
        return categoryList;
      } else {
        throw Exception("Invalid response format. Expected a List, but received ${response.data.runtimeType}.");
      }
    } catch (e) {
      print("Error fetching categories: $e");
      throw e; // Rethrow the exception to notify the calling code about the error
    }
  }

  @override
  Future<CategoryModel> postCategories(String categoryName) async {
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

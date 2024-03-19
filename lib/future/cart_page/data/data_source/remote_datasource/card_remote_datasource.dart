// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sultan_mebel/common/models/customer_model.dart';
import 'package:sultan_mebel/common/models/sales_model.dart';
import 'package:sultan_mebel/common/models/shared_model.dart';
import 'package:sultan_mebel/future/products/data/model/branch_model.dart';

abstract class CardRemoteDataSource {
  Future<CustomerModel> getCardCutomer();
  Future<BranchModel> getCardBranches();
  Future<SalesModel> postSales(
    List<Map<String, dynamic>> itemsList,
    String? dateTime,
    double? price,
    String? comment,
    int user,
    int customer,
    int branch,
  );
}

class CardRemoteDataSourceImpl implements CardRemoteDataSource {
  Dio dio;

  CardRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<BranchModel> getCardBranches() {
    // TODO: implement getCardBranches
    throw UnimplementedError();
  }

  @override
  Future<CustomerModel> getCardCutomer() {
    // TODO: implement getCardCutomer
    throw UnimplementedError();
  }

  @override
  Future<SalesModel> postSales(
    int? id,
    List<Map<String, dynamic>>? itemsList,
    String? dateTime,
    double? price,
    String? comment,
    int? user,
    int? customer,
    int? branch,
  ) async {
    final response = await dio.request(
      '/api/v1/scheduled_loans/',
      options: Options(
        method: 'POST',
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ${sharedPreferences.getString(SharedModel.accessToken)}',
        },
      ),
      data: json.encode({
        "items": itemsList,
        "price": price,
        "datetime": commentClient,
        "price": customer,
        "branch": branch,
      }),
    );
    return response.data;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sultan_mebel/common/models/customer_model.dart';

abstract class ClientsRemoteDataSource {
  Future<dynamic> clients();
}

class ClientsRemoteDataSourceImpl extends ClientsRemoteDataSource {
  Dio dio;
  ClientsRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future clients() async {
    final responce = await dio.request(
      '/api/v1/customers/',
      options: Options(
        method: 'GET',
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    var customerList = (jsonDecode(responce.data) as List)
        .map(
          (e) => CustomerModel.fromJson(e),
        )
        .toList();

    return customerList;
  }
}

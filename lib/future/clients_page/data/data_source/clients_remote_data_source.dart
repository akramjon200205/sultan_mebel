// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sultan_mebel/common/models/customer_model.dart';

abstract class ClientsRemoteDataSource {
  Future<dynamic> clients();
  Future<CustomerModel> postClients({String? firstName, String? lastName, String? phone, String? address});
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

    var customerList = (responce.data as List).map((e) => CustomerModel.fromJson(e)).toList();

    return customerList;
  }

  @override
  Future<CustomerModel> postClients({String? firstName, String? lastName, String? phone, String? address}) async {
    final response = await dio.request('/api/v1/customers/',
        options: Options(
          method: 'POST',
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: jsonEncode({
          "first_name": firstName,
          "last_name": lastName,
          "phone": phone,
          "address": address,
        }));

    return CustomerModel.fromJson(response.data);
  }
}

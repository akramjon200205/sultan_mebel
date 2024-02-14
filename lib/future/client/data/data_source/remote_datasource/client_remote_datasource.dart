// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sultan_mebel/common/models/customer_model.dart';

abstract class ClientRemoteDataSource {
  Future<CustomerModel> getClientById({int? id});
  Future<CustomerModel> patchClientById({
    int? id,
    double? loan,
    String? lastName,
    String? firstName,
    String? phone,
    String? address,
  });
}

class ClientRemoteDataSourceImpl implements ClientRemoteDataSource {
  Dio dio;
  ClientRemoteDataSourceImpl({
    required this.dio,
  });
  @override
  Future<CustomerModel> getClientById({int? id}) async {
    final response = await dio.request(
      '/api/v1/customers/$id/',
      options: Options(
        method: 'GET',
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    var customer = CustomerModel.fromJson(response.data);
    return customer;
  }

  @override
  Future<CustomerModel> patchClientById({
    int? id,
    double? loan,
    String? lastName,
    String? firstName,
    String? phone,
    String? address,
  }) async {
    log("$id, $loan, $lastName, $firstName, $phone, $address");

    final response = await dio.request(
      '/api/v1/customers/$id/',
      options: Options(
        method: 'PATCH',
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
      data: json.encode({
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "address": address,
        "loan": loan.toString(),
      }),
    );
    log(response.data.toString());
    var customer = CustomerModel.fromJson(response.data);
    return customer;
  }
}

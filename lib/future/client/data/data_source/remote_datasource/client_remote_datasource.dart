// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sultan_mebel/common/models/customer_model.dart';

abstract class ClientRemoteDataSource {
  Future<dynamic> getClientById({int? id});
  Future<dynamic> patchClientById({
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
  Future getClientById({int? id}) async {
    final response = await dio.request(
      '/api/v1/customers/$id',
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
  Future patchClientById({
    int? id,
    double? loan,
    String? lastName,
    String? firstName,
    String? phone,
    String? address,
  }) async {
    final response = await dio.request(
      '/api/v1/customers/$id',
      options: Options(
        method: 'PATCH',
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
      data: {
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "address": address,
        "loan": "$loan",
      },
    );
    log(response.data);
    return response.data;
  }
}

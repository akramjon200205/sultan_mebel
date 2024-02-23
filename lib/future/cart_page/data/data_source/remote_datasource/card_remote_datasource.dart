// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:sultan_mebel/common/models/customer_model.dart';
import 'package:sultan_mebel/common/models/sales_model.dart';
import 'package:sultan_mebel/future/products/data/model/branch_model.dart';

abstract class CardRemoteDataSource {
  Future<CustomerModel> getCardCutomer();
  Future<BranchModel> getCardBranches();
  Future<SalesModel> postSales();
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
  Future<SalesModel> postSales() {
    // TODO: implement postSales
    throw UnimplementedError();
  }
}

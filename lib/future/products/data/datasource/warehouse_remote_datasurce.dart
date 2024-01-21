// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:sultan_mebel/future/products/data/model/branch_model.dart';

abstract class WarehouseRemoteDataSource {
  Future<List<BranchModel>> getBranchsList();
}

class WareHouseRemoteDataSourceImpl extends WarehouseRemoteDataSource {
  Dio dio;
  WareHouseRemoteDataSourceImpl({
    required this.dio,
  });
  @override
  Future<List<BranchModel>> getBranchsList() async {
    final response = await dio.request('/api/v1/warehouse/',
        options: Options(
          method: 'GET',
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ));

    var branchList = (response.data as List).map((e) => BranchModel.fromJson(e)).toList();
    return branchList;
  }
}

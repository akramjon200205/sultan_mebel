// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:sultan_mebel/common/models/branch_model.dart';

abstract class BranchsRemoteDataSource {
  Future<List<BranchModel>> getBranchs();
}

class BranchsRemoteDataSourceImpl implements BranchsRemoteDataSource {
  Dio dio;
  BranchsRemoteDataSourceImpl({
    required this.dio,
  });
  @override
  Future<List<BranchModel>> getBranchs() async {
    final response = await dio.request(
      'api/v1/branches/',
      options: Options(
        method: 'GET',
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    var branchesList = (response.data as List)
        .map(
          (e) => BranchModel.fromJson(e),
        )
        .toList();
    return branchesList;
  }
}

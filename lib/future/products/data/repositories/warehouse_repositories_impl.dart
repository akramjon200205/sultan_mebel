// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/core/platform/network_info.dart';
import 'package:sultan_mebel/future/products/data/datasource/warehouse_remote_datasurce.dart';
import 'package:sultan_mebel/future/products/data/model/branch_model.dart';
import 'package:sultan_mebel/future/products/domain/repositories/warehouse_repositories.dart';

import '../../../../core/error/exeption.dart';

class WarehouseRepositoriesImpl extends WarehouseRepository {
  WareHouseRemoteDataSourceImpl wareHouseRemoteDataSourceImpl;
   final NetworkInfo networkInfo;
  WarehouseRepositoriesImpl({
    required this.wareHouseRemoteDataSourceImpl,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<BranchModel>>> getBranchsList() async {
    if (await networkInfo.isConnected) {
      try {
        final branchResult = await wareHouseRemoteDataSourceImpl.getBranchsList();
        return Right(branchResult);
      } on DioException catch (e) {
        final failure = DioExceptions.fromDioError(e);
        return Left(failure);
      }
    } else {
      return const Left(
        ConnectionFailure("Connection Failure"),
      );
    }
  }
}

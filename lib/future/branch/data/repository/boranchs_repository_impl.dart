// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sultan_mebel/common/models/branch_model.dart';
import 'package:sultan_mebel/core/error/exeption.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/core/platform/network_info.dart';
import 'package:sultan_mebel/future/branch/data/datasource/remote_datasource/branchs_remote_datasource.dart';
import 'package:sultan_mebel/future/branch/data/models/werehouse_model.dart';
import 'package:sultan_mebel/future/branch/domain/repositories/branchs_repository.dart';

class BranchsRepositoryImpl implements BranchRepository {
  final BranchsRemoteDataSourceImpl branchsRemoteDataSourceImpl;
  final NetworkInfo networkInfo;
  BranchsRepositoryImpl({
    required this.branchsRemoteDataSourceImpl,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<WereHouseModel>>> getBranchs() async {
    if (await networkInfo.isConnected) {
      try {
        final branchsResult = await branchsRemoteDataSourceImpl.getBranchs();
        return Right(branchsResult);
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

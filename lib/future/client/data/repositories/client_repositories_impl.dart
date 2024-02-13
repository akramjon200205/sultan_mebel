// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sultan_mebel/core/error/exeption.dart';

import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/core/platform/network_info.dart';
import 'package:sultan_mebel/future/client/data/data_source/remote_datasource/client_remote_datasource.dart';
import 'package:sultan_mebel/future/client/domain/repositories/client_repositories.dart';

class ClientRepositoriesImpl implements ClientRepositories {
  final ClientRemoteDataSourceImpl clientRemoteDataSourceImpl;
  final NetworkInfo networkInfo;
  ClientRepositoriesImpl({
    required this.clientRemoteDataSourceImpl,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, dynamic>> getClient({int? id}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await clientRemoteDataSourceImpl.getClientById(id: id);
        return Right(result);
      } on DioException catch (e) {
        final failure = DioExceptions.fromDioError(e);
        return Left(failure);
      }
    } else {
      return const Left(ConnectionFailure("Connection error"));
    }
  }

  @override
  Future<Either<Failure, dynamic>> patchClient({
    int? id,
    double? loan,
    String? lastName,
    String? firstName,
    String? phone,
    String? address,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await clientRemoteDataSourceImpl.patchClientById(id: id, loan: loan);
        return Right(result);
      } on DioException catch (e) {
        final failure = DioExceptions.fromDioError(e);
        return Left(failure);
      }
    } else {
      return const Left(ConnectionFailure("Connection error"));
    }
  }
}

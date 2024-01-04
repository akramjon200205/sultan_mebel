// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sultan_mebel/common/models/customer_model.dart';
import 'package:sultan_mebel/core/error/exeption.dart';

import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/core/platform/network_info.dart';
import 'package:sultan_mebel/future/client_page/domain/repositories/clients_repositories.dart';
import 'package:sultan_mebel/future/clients_page/data/data_source/clients_remote_data_source.dart';

class ClientsRepositoriesImpl extends ClientsRepositories {
  final ClientsRemoteDataSourceImpl clientsRemoteDataSourceImpl;
  final NetworkInfo networkInfo;
  ClientsRepositoriesImpl({
    required this.clientsRemoteDataSourceImpl,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CustomerModel>>> clients() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await clientsRemoteDataSourceImpl.clients();
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

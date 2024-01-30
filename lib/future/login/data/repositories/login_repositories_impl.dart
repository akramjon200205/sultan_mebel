import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exeption.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/repositories/login_repositories.dart';
import '../datasource/lodin_remote_datasouce.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSourceImpl remoteDataSourceImpl;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({
    required this.remoteDataSourceImpl,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, String>> login(String? userName, String? password) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSourceImpl.login(userName, password);
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sultan_mebel/core/error/exeption.dart';

import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/core/platform/network_info.dart';
import 'package:sultan_mebel/future/home/data/datasourses/ramote_datasource/category_remote_datasource.dart';
import 'package:sultan_mebel/future/home/data/models/category_model.dart';
import 'package:sultan_mebel/future/home/domain/repositories/category_repositories.dart';

class CategoryRepositoriesImpl implements CategoryRepository {
  final CategoryRemoteDataSourceImpl categoryRemoteDataSourceImpl;
  final NetworkInfo networkInfo;
  CategoryRepositoriesImpl({
    required this.categoryRemoteDataSourceImpl,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CategoryModel>>> getCatgories() async {
    if (await networkInfo.isConnected) {
      try {
        final categoryResult = await categoryRemoteDataSourceImpl.categories();
        return Right(categoryResult);
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

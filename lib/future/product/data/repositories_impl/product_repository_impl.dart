// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:sultan_mebel/common/models/products_model.dart';
import 'package:sultan_mebel/core/error/exeption.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/core/platform/network_info.dart';
import 'package:sultan_mebel/future/product/domain/repositories/product_repository.dart';

import '../datasource/remote_datasource/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasourceImpl productRemoteDatasource;
  final NetworkInfo networkInfo;
  ProductRepositoryImpl({
    required this.productRemoteDatasource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, ProductsModel>> getProduct(int? id) async {
    if (await networkInfo.isConnected) {
      try {
        final prostProductResult = await productRemoteDatasource.getProduct(id);
        return Right(prostProductResult);
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

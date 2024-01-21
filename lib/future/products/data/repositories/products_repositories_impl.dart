// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sultan_mebel/core/error/exeption.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/core/platform/network_info.dart';
import 'package:sultan_mebel/future/products/data/datasource/products_remote_datasource.dart';
import 'package:sultan_mebel/future/products/data/model/branch_model.dart';
import 'package:sultan_mebel/future/products/data/model/warehouse_items_model.dart';
import 'package:sultan_mebel/future/products/domain/repositories/products_repositories.dart';

import '../../../../common/models/products_model.dart';

class ProductRepositoriesImpl implements ProductRepositories {
  final ProductRemoteDataSouceImpl productRemoteDataSouceImpl;
  final NetworkInfo networkInfo;
  ProductRepositoriesImpl({
    required this.productRemoteDataSouceImpl,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<WarehouseItemsModel>>> getProductsList(int? id) async {
    if (await networkInfo.isConnected) {
      try {
        final categoryResult = await productRemoteDataSouceImpl.getProducts(id);
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

  @override
  Future<Either<Failure, ProductsModel>> postProcduct(String name, int categoryId, String size, double price) async {
    if (await networkInfo.isConnected) {
      try {
        final prostProductResult = await productRemoteDataSouceImpl.postProduct(name, categoryId, size, price);
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

  @override
  Future<Either<Failure, List<WarehouseItemsModel>>> getProductsOfWarehouse(int? idCategory, int? idWarehouse) async {
    if (await networkInfo.isConnected) {
      try {
        final productOfWarehouse = await productRemoteDataSouceImpl.getProductsOfWarehouse(idCategory, idWarehouse);
        return Right(productOfWarehouse);
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

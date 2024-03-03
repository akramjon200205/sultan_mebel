// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:sultan_mebel/common/models/customer_model.dart';
import 'package:sultan_mebel/common/models/sales_model.dart';
import 'package:sultan_mebel/core/error/exeption.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/core/platform/network_info.dart';
import 'package:sultan_mebel/future/cart_page/data/data_source/remote_datasource/card_remote_datasource.dart';
import 'package:sultan_mebel/future/cart_page/domain/repositories/card_repository.dart';
import 'package:sultan_mebel/future/products/data/model/branch_model.dart';

class CardRepositoryImpl implements CardRepository {
  final CardRemoteDataSourceImpl cardRemoteDataSourceImpl;
  final NetworkInfo networkInfo;

  CardRepositoryImpl({
    required this.cardRemoteDataSourceImpl,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, BranchModel>> getCardBranches() {
    // TODO: implement getCardBranches
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CustomerModel>> getCardCustomer() {
    // TODO: implement getCardCustomer
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SalesModel>> postSales({
    int? id,
    List<Map<String, dynamic>>? itemsList,
    String? dateTime,
    double? price,
    String? comment,
    int? user,
    int? customer,
    int? branch,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final putAmount = await cardRemoteDataSourceImpl.postSales(
          id,
          itemsList!,
          dateTime!,
          price,
          comment!,
          user!,
          customer!,
          branch,
        );
        return Right(putAmount);
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

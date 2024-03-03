import 'package:dartz/dartz.dart';
import 'package:sultan_mebel/common/models/customer_model.dart';
import 'package:sultan_mebel/common/models/sales_model.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/products/data/model/branch_model.dart';

abstract class CardRepository {
  Future<Either<Failure, CustomerModel>> getCardCustomer();
  Future<Either<Failure, BranchModel>> getCardBranches();
  Future<Either<Failure, SalesModel>> postSales({
    List<Map<String, dynamic>>? itemsList,
    String? dateTime,
    double? price,
    String? comment,
    int? user,
    int? customer,
    int? branch,
  });
}

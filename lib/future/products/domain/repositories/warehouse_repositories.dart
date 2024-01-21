import 'package:dartz/dartz.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/products/data/model/branch_model.dart';

abstract class WarehouseRepository {
  Future<Either<Failure, List<BranchModel>>> getBranchsList();
}

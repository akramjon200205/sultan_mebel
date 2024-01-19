import 'package:dartz/dartz.dart';
import 'package:sultan_mebel/common/models/branch_model.dart';
import 'package:sultan_mebel/future/branch/data/models/werehouse_model.dart';

import '../../../../core/error/failure.dart';

abstract class BranchRepository {
  Future<Either<Failure, List<WereHouseModel>>> getBranchs();
}

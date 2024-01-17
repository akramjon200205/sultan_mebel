import 'package:dartz/dartz.dart';
import 'package:sultan_mebel/common/models/branch_model.dart';

import '../../../../core/error/failure.dart';

abstract class BranchRepository {
  Future<Either<Failure, List<BranchModel>>> getBranchs();
}

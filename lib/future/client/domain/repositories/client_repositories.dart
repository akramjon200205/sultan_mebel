import 'package:dartz/dartz.dart';
import 'package:sultan_mebel/common/models/customer_model.dart';

import '../../../../core/error/failure.dart';

abstract class ClientRepositories {
  Future<Either<Failure, CustomerModel>> getClient({int? id});
  Future<Either<Failure, CustomerModel>> patchClient({
    int? id,
    double? loan,
    String? lastName,
    String? firstName,
    String? phone,
    String? address,
  });
}

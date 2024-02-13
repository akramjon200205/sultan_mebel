import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class ClientRepositories {
  Future<Either<Failure, dynamic>> getClient({int? id});
  Future<Either<Failure, dynamic>> patchClient({int? id, double? loan});
}

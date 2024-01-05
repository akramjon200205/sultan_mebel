import 'package:dartz/dartz.dart';
import 'package:sultan_mebel/core/error/failure.dart';

abstract class ClientsRepositories {
  Future<Either<Failure, dynamic>> clients();
}

import 'package:dartz/dartz.dart';
import 'package:sultan_mebel/core/error/failure.dart';

abstract class ClientsRepositories {
  Future<Either<Failure, dynamic>> clients();
  Future<Either<Failure, dynamic>> postClients({String? firstName, String? lastName, String? phone, String? address});
}

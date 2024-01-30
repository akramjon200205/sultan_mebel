import 'package:dartz/dartz.dart';
import 'package:sultan_mebel/core/error/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> login(String? userName, String? password);
}

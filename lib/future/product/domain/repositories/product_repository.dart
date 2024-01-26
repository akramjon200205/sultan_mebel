import 'package:dartz/dartz.dart';
import 'package:sultan_mebel/common/models/products_model.dart';
import 'package:sultan_mebel/core/error/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductsModel>> getProduct(int? id);
  Future<Either<Failure, ProductsModel>> postProduct(
    String? name,
    double? price,
    String? sizes,
    int? category,
    int? id,
  );
}

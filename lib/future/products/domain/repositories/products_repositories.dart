import 'package:dartz/dartz.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/home/data/models/category_model.dart';

abstract class ProductRepositories {
  Future<Either<Failure, CategoryModel>> getProductsList(int? id);
  Future<Either<Failure, Products>> postProcduct(String name, int categoryId, String size, double price);  
}

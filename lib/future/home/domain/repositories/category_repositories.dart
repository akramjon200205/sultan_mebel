import 'package:dartz/dartz.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/home/data/models/category_model.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryModel>>> getCatgories();
}

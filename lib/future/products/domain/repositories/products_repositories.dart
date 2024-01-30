import 'package:dartz/dartz.dart';
import 'package:sultan_mebel/common/models/products_model.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/products/data/model/warehouse_items_model.dart';

abstract class ProductsRepositories {
  Future<Either<Failure, List<WarehouseItemsModel>>> getProductsList(int? id);
  Future<Either<Failure, List<WarehouseItemsModel>>> getProductsOfWarehouse(int? idCategory, int? idWarehouse);
  Future<Either<Failure, ProductsModel>> postProcduct(String name, int categoryId, String size, double price);
}

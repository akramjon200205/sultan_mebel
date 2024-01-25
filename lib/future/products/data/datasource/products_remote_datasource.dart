import 'package:dio/dio.dart';
import '../../../../common/models/products_model.dart';
import '../model/warehouse_items_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<WarehouseItemsModel>> getProducts(int? id);
  Future<List<WarehouseItemsModel>> getProductsOfWarehouse(int? idCategory, int? idWarehouse);
  Future<ProductsModel> postProduct(
    String name,
    int categoryId,
    String size,
    double price,
  );
}

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  Dio dio;
  ProductsRemoteDataSourceImpl({
    required this.dio,
  });
  @override
  Future<List<WarehouseItemsModel>> getProducts(int? id) async {
    try {
      final response = await dio.request('/api/v1/warehouse-items/?category_id=$id',
          options: Options(
            method: 'GET',
            headers: {
              'accept': 'application/json',
              'Content-Type': 'application/json',
            },
          ));

      var productsList = (response.data as List).map((e) => WarehouseItemsModel.fromJson(e)).toList();
      return productsList;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<ProductsModel> postProduct(String name, int categoryId, String size, double price) async {
    final responce = await dio.request(
      '/api/v1/products/',
      options: Options(
        method: 'POST',
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
      data: {
        "name": name,
        "price": price,
        "sizes": size,
        "category": categoryId,
      },
    );
    return ProductsModel.fromJson(responce.data);
  }

  @override
  Future<List<WarehouseItemsModel>> getProductsOfWarehouse(int? idCategory, int? idWarehouse) async {
    final response = await dio.request(
      '/api/v1/warehouse-items/?warehouse_id=$idWarehouse&category_id=$idCategory',
      options: Options(
        method: 'GET',
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    var branchList = (response.data as List).map((e) => WarehouseItemsModel.fromJson(e)).toList();
    return branchList;
  }
}

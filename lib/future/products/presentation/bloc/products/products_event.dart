// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

// ignore: must_be_immutable
class ProductsEvent extends Equatable {
  int? idCategory;
  int? idWarehouse;
  ProductsEvent(
    this.idCategory,
    this.idWarehouse,
  );

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ProductPostEvent extends ProductsEvent {
  final String productName;
  final String productSize;
  final int? productCategoryId;
  final double productPrice;
  final int? warehouseId;

  ProductPostEvent(
    this.productName,
    this.productSize,
    this.productCategoryId,
    this.productPrice,
    this.warehouseId,
  ) : super(
          productCategoryId,
          warehouseId,
        );
}

// ignore: must_be_immutable
// class ProductsOfWarehouseEvent extends ProductsEvent {
//   int? idCategory;
//   int? idWarehouse;
//   ProductsOfWarehouseEvent({
//     this.idCategory,
//     this.idWarehouse,
//   }) : super(idCategory, idWarehouse);
// }

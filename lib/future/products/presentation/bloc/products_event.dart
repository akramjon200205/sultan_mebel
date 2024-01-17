// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

// ignore: must_be_immutable
class ProductsEvent extends Equatable {
  int? id;
  ProductsEvent(
    this.id,
  );

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ProductPostEvent extends ProductsEvent {
  
  final String productName;  
  final String productSize;
  final int productCategoryId;
  final double productPrice;



  ProductPostEvent(
    this.productName,
    this.productSize,
    this.productCategoryId,
    this.productPrice,
  ) : super(productCategoryId);
}

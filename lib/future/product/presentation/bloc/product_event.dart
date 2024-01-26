// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

// ignore: must_be_immutable
class ProductEvent extends Equatable {
  int? id;
  ProductEvent(this.id);

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ProductPostEvent extends ProductEvent {
  String? name;
  double? price;
  String? sizes;
  int? category;
  int? idproduct;

  ProductPostEvent(this.name,  this.price, this.sizes, this.category, this.idproduct) : super(idproduct);

  @override
  List<Object> get props => [];
}

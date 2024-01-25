part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusGetProduct,
    final String? message,
    final ProductsModel? productsModel,
  }) = _ProductState;

  const ProductState._();
}

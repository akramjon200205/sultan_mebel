part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusGetProduct,
    @Default(BlocStatus.notInitialized) final BlocStatus statusPostProduct,
    final String? message,
    final ProductsModel? productsModel,
    final ProductsModel? postProduct,
  }) = _ProductState;

  const ProductState._();
}

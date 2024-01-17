part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusGetProductCategory,
    @Default(BlocStatus.notInitialized) final BlocStatus statusPostProductCategory,
    final String? message,
    final CategoryModel? productsList,
    final Products? productsModel,
  }) = _ProductsState;

  const ProductsState._();
}

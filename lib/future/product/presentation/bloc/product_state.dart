part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusGetProduct,
    @Default(BlocStatus.notInitialized) final BlocStatus statusPostProduct,
    @Default(BlocStatus.notInitialized) final BlocStatus statusPutAmount,
    final String? message,
    final ProductsModel? productsModel,
    final ProductsModel? postProduct,    
    final WarehouseItemsModel? putAmount,
  }) = _ProductState;

  const ProductState._();
}

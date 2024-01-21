part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusGetProductCategory,
    @Default(BlocStatus.notInitialized) final BlocStatus statusPostProductCategory,
    @Default(BlocStatus.notInitialized) final BlocStatus statusGetBranchs,
    final String? message,
    final List<WarehouseItemsModel>? productsList,
    final ProductsModel? productsModel,
    final List<BranchModel>? branchList,
    final List<String>? branch,
  }) = _ProductsState;

  const ProductsState._();
}

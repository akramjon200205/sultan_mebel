part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusCategory,
    @Default(BlocStatus.notInitialized) final BlocStatus statusPostCategory,
    @Default(BlocStatus.notInitialized) final BlocStatus statusGetProductCategory,
    @Default(BlocStatus.notInitialized) final BlocStatus statusPostProductCategory,
    final String? message,
    final List<CategoryModel>? categoryList,
    final CategoryModel? categoryModel,
  }) = _HomeState;

  const HomeState._();
}

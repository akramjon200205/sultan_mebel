part of 'home_bloc.dart';


@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusCategory,
    @Default(BlocStatus.notInitialized) final BlocStatus statusPostCategory,
    final String? message,
    final List<CategoryModel>? categoryList,
    final CategoryModel? categoryModel,
  }) = _HomeState;

  const HomeState._();
}

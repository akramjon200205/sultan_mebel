part of 'home_bloc.dart';


@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusCategory,
    final String? message,
    final List<CategoryModel>? categoryList,
  }) = _HomeState;

  const HomeState._();
}

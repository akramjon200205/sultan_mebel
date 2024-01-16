// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  BlocStatus get statusCategory => throw _privateConstructorUsedError;
  BlocStatus get statusPostCategory => throw _privateConstructorUsedError;
  BlocStatus get statusGetProductCategory => throw _privateConstructorUsedError;
  BlocStatus get statusPostProductCategory =>
      throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<CategoryModel>? get categoryList => throw _privateConstructorUsedError;
  CategoryModel? get categoryModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {BlocStatus statusCategory,
      BlocStatus statusPostCategory,
      BlocStatus statusGetProductCategory,
      BlocStatus statusPostProductCategory,
      String? message,
      List<CategoryModel>? categoryList,
      CategoryModel? categoryModel});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCategory = null,
    Object? statusPostCategory = null,
    Object? statusGetProductCategory = null,
    Object? statusPostProductCategory = null,
    Object? message = freezed,
    Object? categoryList = freezed,
    Object? categoryModel = freezed,
  }) {
    return _then(_value.copyWith(
      statusCategory: null == statusCategory
          ? _value.statusCategory
          : statusCategory // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusPostCategory: null == statusPostCategory
          ? _value.statusPostCategory
          : statusPostCategory // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusGetProductCategory: null == statusGetProductCategory
          ? _value.statusGetProductCategory
          : statusGetProductCategory // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusPostProductCategory: null == statusPostProductCategory
          ? _value.statusPostProductCategory
          : statusPostProductCategory // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryList: freezed == categoryList
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
      categoryModel: freezed == categoryModel
          ? _value.categoryModel
          : categoryModel // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus statusCategory,
      BlocStatus statusPostCategory,
      BlocStatus statusGetProductCategory,
      BlocStatus statusPostProductCategory,
      String? message,
      List<CategoryModel>? categoryList,
      CategoryModel? categoryModel});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCategory = null,
    Object? statusPostCategory = null,
    Object? statusGetProductCategory = null,
    Object? statusPostProductCategory = null,
    Object? message = freezed,
    Object? categoryList = freezed,
    Object? categoryModel = freezed,
  }) {
    return _then(_$HomeStateImpl(
      statusCategory: null == statusCategory
          ? _value.statusCategory
          : statusCategory // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusPostCategory: null == statusPostCategory
          ? _value.statusPostCategory
          : statusPostCategory // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusGetProductCategory: null == statusGetProductCategory
          ? _value.statusGetProductCategory
          : statusGetProductCategory // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusPostProductCategory: null == statusPostProductCategory
          ? _value.statusPostProductCategory
          : statusPostProductCategory // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryList: freezed == categoryList
          ? _value._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
      categoryModel: freezed == categoryModel
          ? _value.categoryModel
          : categoryModel // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl extends _HomeState {
  const _$HomeStateImpl(
      {this.statusCategory = BlocStatus.notInitialized,
      this.statusPostCategory = BlocStatus.notInitialized,
      this.statusGetProductCategory = BlocStatus.notInitialized,
      this.statusPostProductCategory = BlocStatus.notInitialized,
      this.message,
      final List<CategoryModel>? categoryList,
      this.categoryModel})
      : _categoryList = categoryList,
        super._();

  @override
  @JsonKey()
  final BlocStatus statusCategory;
  @override
  @JsonKey()
  final BlocStatus statusPostCategory;
  @override
  @JsonKey()
  final BlocStatus statusGetProductCategory;
  @override
  @JsonKey()
  final BlocStatus statusPostProductCategory;
  @override
  final String? message;
  final List<CategoryModel>? _categoryList;
  @override
  List<CategoryModel>? get categoryList {
    final value = _categoryList;
    if (value == null) return null;
    if (_categoryList is EqualUnmodifiableListView) return _categoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CategoryModel? categoryModel;

  @override
  String toString() {
    return 'HomeState(statusCategory: $statusCategory, statusPostCategory: $statusPostCategory, statusGetProductCategory: $statusGetProductCategory, statusPostProductCategory: $statusPostProductCategory, message: $message, categoryList: $categoryList, categoryModel: $categoryModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.statusCategory, statusCategory) ||
                other.statusCategory == statusCategory) &&
            (identical(other.statusPostCategory, statusPostCategory) ||
                other.statusPostCategory == statusPostCategory) &&
            (identical(
                    other.statusGetProductCategory, statusGetProductCategory) ||
                other.statusGetProductCategory == statusGetProductCategory) &&
            (identical(other.statusPostProductCategory,
                    statusPostProductCategory) ||
                other.statusPostProductCategory == statusPostProductCategory) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._categoryList, _categoryList) &&
            (identical(other.categoryModel, categoryModel) ||
                other.categoryModel == categoryModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCategory,
      statusPostCategory,
      statusGetProductCategory,
      statusPostProductCategory,
      message,
      const DeepCollectionEquality().hash(_categoryList),
      categoryModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {final BlocStatus statusCategory,
      final BlocStatus statusPostCategory,
      final BlocStatus statusGetProductCategory,
      final BlocStatus statusPostProductCategory,
      final String? message,
      final List<CategoryModel>? categoryList,
      final CategoryModel? categoryModel}) = _$HomeStateImpl;
  const _HomeState._() : super._();

  @override
  BlocStatus get statusCategory;
  @override
  BlocStatus get statusPostCategory;
  @override
  BlocStatus get statusGetProductCategory;
  @override
  BlocStatus get statusPostProductCategory;
  @override
  String? get message;
  @override
  List<CategoryModel>? get categoryList;
  @override
  CategoryModel? get categoryModel;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

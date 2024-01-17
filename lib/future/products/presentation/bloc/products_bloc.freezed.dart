// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductsState {
  BlocStatus get statusGetProductCategory => throw _privateConstructorUsedError;
  BlocStatus get statusPostProductCategory =>
      throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  CategoryModel? get productsList => throw _privateConstructorUsedError;
  Products? get productsModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsStateCopyWith<ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsStateCopyWith<$Res> {
  factory $ProductsStateCopyWith(
          ProductsState value, $Res Function(ProductsState) then) =
      _$ProductsStateCopyWithImpl<$Res, ProductsState>;
  @useResult
  $Res call(
      {BlocStatus statusGetProductCategory,
      BlocStatus statusPostProductCategory,
      String? message,
      CategoryModel? productsList,
      Products? productsModel});
}

/// @nodoc
class _$ProductsStateCopyWithImpl<$Res, $Val extends ProductsState>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusGetProductCategory = null,
    Object? statusPostProductCategory = null,
    Object? message = freezed,
    Object? productsList = freezed,
    Object? productsModel = freezed,
  }) {
    return _then(_value.copyWith(
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
      productsList: freezed == productsList
          ? _value.productsList
          : productsList // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      productsModel: freezed == productsModel
          ? _value.productsModel
          : productsModel // ignore: cast_nullable_to_non_nullable
              as Products?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsStateImplCopyWith<$Res>
    implements $ProductsStateCopyWith<$Res> {
  factory _$$ProductsStateImplCopyWith(
          _$ProductsStateImpl value, $Res Function(_$ProductsStateImpl) then) =
      __$$ProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus statusGetProductCategory,
      BlocStatus statusPostProductCategory,
      String? message,
      CategoryModel? productsList,
      Products? productsModel});
}

/// @nodoc
class __$$ProductsStateImplCopyWithImpl<$Res>
    extends _$ProductsStateCopyWithImpl<$Res, _$ProductsStateImpl>
    implements _$$ProductsStateImplCopyWith<$Res> {
  __$$ProductsStateImplCopyWithImpl(
      _$ProductsStateImpl _value, $Res Function(_$ProductsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusGetProductCategory = null,
    Object? statusPostProductCategory = null,
    Object? message = freezed,
    Object? productsList = freezed,
    Object? productsModel = freezed,
  }) {
    return _then(_$ProductsStateImpl(
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
      productsList: freezed == productsList
          ? _value.productsList
          : productsList // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      productsModel: freezed == productsModel
          ? _value.productsModel
          : productsModel // ignore: cast_nullable_to_non_nullable
              as Products?,
    ));
  }
}

/// @nodoc

class _$ProductsStateImpl extends _ProductsState {
  const _$ProductsStateImpl(
      {this.statusGetProductCategory = BlocStatus.notInitialized,
      this.statusPostProductCategory = BlocStatus.notInitialized,
      this.message,
      this.productsList,
      this.productsModel})
      : super._();

  @override
  @JsonKey()
  final BlocStatus statusGetProductCategory;
  @override
  @JsonKey()
  final BlocStatus statusPostProductCategory;
  @override
  final String? message;
  @override
  final CategoryModel? productsList;
  @override
  final Products? productsModel;

  @override
  String toString() {
    return 'ProductsState(statusGetProductCategory: $statusGetProductCategory, statusPostProductCategory: $statusPostProductCategory, message: $message, productsList: $productsList, productsModel: $productsModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsStateImpl &&
            (identical(
                    other.statusGetProductCategory, statusGetProductCategory) ||
                other.statusGetProductCategory == statusGetProductCategory) &&
            (identical(other.statusPostProductCategory,
                    statusPostProductCategory) ||
                other.statusPostProductCategory == statusPostProductCategory) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.productsList, productsList) ||
                other.productsList == productsList) &&
            (identical(other.productsModel, productsModel) ||
                other.productsModel == productsModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusGetProductCategory,
      statusPostProductCategory, message, productsList, productsModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      __$$ProductsStateImplCopyWithImpl<_$ProductsStateImpl>(this, _$identity);
}

abstract class _ProductsState extends ProductsState {
  const factory _ProductsState(
      {final BlocStatus statusGetProductCategory,
      final BlocStatus statusPostProductCategory,
      final String? message,
      final CategoryModel? productsList,
      final Products? productsModel}) = _$ProductsStateImpl;
  const _ProductsState._() : super._();

  @override
  BlocStatus get statusGetProductCategory;
  @override
  BlocStatus get statusPostProductCategory;
  @override
  String? get message;
  @override
  CategoryModel? get productsList;
  @override
  Products? get productsModel;
  @override
  @JsonKey(ignore: true)
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

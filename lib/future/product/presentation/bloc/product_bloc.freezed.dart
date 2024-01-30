// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductState {
  BlocStatus get statusGetProduct => throw _privateConstructorUsedError;
  BlocStatus get statusPostProduct => throw _privateConstructorUsedError;
  BlocStatus get statusPutAmount => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ProductsModel? get productsModel => throw _privateConstructorUsedError;
  ProductsModel? get postProduct => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  WarehouseItemsModel? get putAmount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductStateCopyWith<ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
  @useResult
  $Res call(
      {BlocStatus statusGetProduct,
      BlocStatus statusPostProduct,
      BlocStatus statusPutAmount,
      String? message,
      ProductsModel? productsModel,
      ProductsModel? postProduct,
      int? amount,
      WarehouseItemsModel? putAmount});
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusGetProduct = null,
    Object? statusPostProduct = null,
    Object? statusPutAmount = null,
    Object? message = freezed,
    Object? productsModel = freezed,
    Object? postProduct = freezed,
    Object? amount = freezed,
    Object? putAmount = freezed,
  }) {
    return _then(_value.copyWith(
      statusGetProduct: null == statusGetProduct
          ? _value.statusGetProduct
          : statusGetProduct // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusPostProduct: null == statusPostProduct
          ? _value.statusPostProduct
          : statusPostProduct // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusPutAmount: null == statusPutAmount
          ? _value.statusPutAmount
          : statusPutAmount // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      productsModel: freezed == productsModel
          ? _value.productsModel
          : productsModel // ignore: cast_nullable_to_non_nullable
              as ProductsModel?,
      postProduct: freezed == postProduct
          ? _value.postProduct
          : postProduct // ignore: cast_nullable_to_non_nullable
              as ProductsModel?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      putAmount: freezed == putAmount
          ? _value.putAmount
          : putAmount // ignore: cast_nullable_to_non_nullable
              as WarehouseItemsModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductStateImplCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$$ProductStateImplCopyWith(
          _$ProductStateImpl value, $Res Function(_$ProductStateImpl) then) =
      __$$ProductStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus statusGetProduct,
      BlocStatus statusPostProduct,
      BlocStatus statusPutAmount,
      String? message,
      ProductsModel? productsModel,
      ProductsModel? postProduct,
      int? amount,
      WarehouseItemsModel? putAmount});
}

/// @nodoc
class __$$ProductStateImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductStateImpl>
    implements _$$ProductStateImplCopyWith<$Res> {
  __$$ProductStateImplCopyWithImpl(
      _$ProductStateImpl _value, $Res Function(_$ProductStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusGetProduct = null,
    Object? statusPostProduct = null,
    Object? statusPutAmount = null,
    Object? message = freezed,
    Object? productsModel = freezed,
    Object? postProduct = freezed,
    Object? amount = freezed,
    Object? putAmount = freezed,
  }) {
    return _then(_$ProductStateImpl(
      statusGetProduct: null == statusGetProduct
          ? _value.statusGetProduct
          : statusGetProduct // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusPostProduct: null == statusPostProduct
          ? _value.statusPostProduct
          : statusPostProduct // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusPutAmount: null == statusPutAmount
          ? _value.statusPutAmount
          : statusPutAmount // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      productsModel: freezed == productsModel
          ? _value.productsModel
          : productsModel // ignore: cast_nullable_to_non_nullable
              as ProductsModel?,
      postProduct: freezed == postProduct
          ? _value.postProduct
          : postProduct // ignore: cast_nullable_to_non_nullable
              as ProductsModel?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      putAmount: freezed == putAmount
          ? _value.putAmount
          : putAmount // ignore: cast_nullable_to_non_nullable
              as WarehouseItemsModel?,
    ));
  }
}

/// @nodoc

class _$ProductStateImpl extends _ProductState {
  const _$ProductStateImpl(
      {this.statusGetProduct = BlocStatus.notInitialized,
      this.statusPostProduct = BlocStatus.notInitialized,
      this.statusPutAmount = BlocStatus.notInitialized,
      this.message,
      this.productsModel,
      this.postProduct,
      this.amount,
      this.putAmount})
      : super._();

  @override
  @JsonKey()
  final BlocStatus statusGetProduct;
  @override
  @JsonKey()
  final BlocStatus statusPostProduct;
  @override
  @JsonKey()
  final BlocStatus statusPutAmount;
  @override
  final String? message;
  @override
  final ProductsModel? productsModel;
  @override
  final ProductsModel? postProduct;
  @override
  final int? amount;
  @override
  final WarehouseItemsModel? putAmount;

  @override
  String toString() {
    return 'ProductState(statusGetProduct: $statusGetProduct, statusPostProduct: $statusPostProduct, statusPutAmount: $statusPutAmount, message: $message, productsModel: $productsModel, postProduct: $postProduct, amount: $amount, putAmount: $putAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStateImpl &&
            (identical(other.statusGetProduct, statusGetProduct) ||
                other.statusGetProduct == statusGetProduct) &&
            (identical(other.statusPostProduct, statusPostProduct) ||
                other.statusPostProduct == statusPostProduct) &&
            (identical(other.statusPutAmount, statusPutAmount) ||
                other.statusPutAmount == statusPutAmount) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.productsModel, productsModel) ||
                other.productsModel == productsModel) &&
            (identical(other.postProduct, postProduct) ||
                other.postProduct == postProduct) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.putAmount, putAmount) ||
                other.putAmount == putAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusGetProduct,
      statusPostProduct,
      statusPutAmount,
      message,
      productsModel,
      postProduct,
      amount,
      putAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStateImplCopyWith<_$ProductStateImpl> get copyWith =>
      __$$ProductStateImplCopyWithImpl<_$ProductStateImpl>(this, _$identity);
}

abstract class _ProductState extends ProductState {
  const factory _ProductState(
      {final BlocStatus statusGetProduct,
      final BlocStatus statusPostProduct,
      final BlocStatus statusPutAmount,
      final String? message,
      final ProductsModel? productsModel,
      final ProductsModel? postProduct,
      final int? amount,
      final WarehouseItemsModel? putAmount}) = _$ProductStateImpl;
  const _ProductState._() : super._();

  @override
  BlocStatus get statusGetProduct;
  @override
  BlocStatus get statusPostProduct;
  @override
  BlocStatus get statusPutAmount;
  @override
  String? get message;
  @override
  ProductsModel? get productsModel;
  @override
  ProductsModel? get postProduct;
  @override
  int? get amount;
  @override
  WarehouseItemsModel? get putAmount;
  @override
  @JsonKey(ignore: true)
  _$$ProductStateImplCopyWith<_$ProductStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

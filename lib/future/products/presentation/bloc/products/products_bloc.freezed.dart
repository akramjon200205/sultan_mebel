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
  BlocStatus get statusGetBranchs => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<WarehouseItemsModel>? get productsList =>
      throw _privateConstructorUsedError;
  ProductsModel? get productsModel => throw _privateConstructorUsedError;
  List<BranchModel>? get branchList => throw _privateConstructorUsedError;
  List<String>? get branch => throw _privateConstructorUsedError;

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
      BlocStatus statusGetBranchs,
      String? message,
      List<WarehouseItemsModel>? productsList,
      ProductsModel? productsModel,
      List<BranchModel>? branchList,
      List<String>? branch});
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
    Object? statusGetBranchs = null,
    Object? message = freezed,
    Object? productsList = freezed,
    Object? productsModel = freezed,
    Object? branchList = freezed,
    Object? branch = freezed,
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
      statusGetBranchs: null == statusGetBranchs
          ? _value.statusGetBranchs
          : statusGetBranchs // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      productsList: freezed == productsList
          ? _value.productsList
          : productsList // ignore: cast_nullable_to_non_nullable
              as List<WarehouseItemsModel>?,
      productsModel: freezed == productsModel
          ? _value.productsModel
          : productsModel // ignore: cast_nullable_to_non_nullable
              as ProductsModel?,
      branchList: freezed == branchList
          ? _value.branchList
          : branchList // ignore: cast_nullable_to_non_nullable
              as List<BranchModel>?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      BlocStatus statusGetBranchs,
      String? message,
      List<WarehouseItemsModel>? productsList,
      ProductsModel? productsModel,
      List<BranchModel>? branchList,
      List<String>? branch});
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
    Object? statusGetBranchs = null,
    Object? message = freezed,
    Object? productsList = freezed,
    Object? productsModel = freezed,
    Object? branchList = freezed,
    Object? branch = freezed,
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
      statusGetBranchs: null == statusGetBranchs
          ? _value.statusGetBranchs
          : statusGetBranchs // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      productsList: freezed == productsList
          ? _value._productsList
          : productsList // ignore: cast_nullable_to_non_nullable
              as List<WarehouseItemsModel>?,
      productsModel: freezed == productsModel
          ? _value.productsModel
          : productsModel // ignore: cast_nullable_to_non_nullable
              as ProductsModel?,
      branchList: freezed == branchList
          ? _value._branchList
          : branchList // ignore: cast_nullable_to_non_nullable
              as List<BranchModel>?,
      branch: freezed == branch
          ? _value._branch
          : branch // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$ProductsStateImpl extends _ProductsState {
  const _$ProductsStateImpl(
      {this.statusGetProductCategory = BlocStatus.notInitialized,
      this.statusPostProductCategory = BlocStatus.notInitialized,
      this.statusGetBranchs = BlocStatus.notInitialized,
      this.message,
      final List<WarehouseItemsModel>? productsList,
      this.productsModel,
      final List<BranchModel>? branchList,
      final List<String>? branch})
      : _productsList = productsList,
        _branchList = branchList,
        _branch = branch,
        super._();

  @override
  @JsonKey()
  final BlocStatus statusGetProductCategory;
  @override
  @JsonKey()
  final BlocStatus statusPostProductCategory;
  @override
  @JsonKey()
  final BlocStatus statusGetBranchs;
  @override
  final String? message;
  final List<WarehouseItemsModel>? _productsList;
  @override
  List<WarehouseItemsModel>? get productsList {
    final value = _productsList;
    if (value == null) return null;
    if (_productsList is EqualUnmodifiableListView) return _productsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ProductsModel? productsModel;
  final List<BranchModel>? _branchList;
  @override
  List<BranchModel>? get branchList {
    final value = _branchList;
    if (value == null) return null;
    if (_branchList is EqualUnmodifiableListView) return _branchList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _branch;
  @override
  List<String>? get branch {
    final value = _branch;
    if (value == null) return null;
    if (_branch is EqualUnmodifiableListView) return _branch;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductsState(statusGetProductCategory: $statusGetProductCategory, statusPostProductCategory: $statusPostProductCategory, statusGetBranchs: $statusGetBranchs, message: $message, productsList: $productsList, productsModel: $productsModel, branchList: $branchList, branch: $branch)';
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
            (identical(other.statusGetBranchs, statusGetBranchs) ||
                other.statusGetBranchs == statusGetBranchs) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._productsList, _productsList) &&
            (identical(other.productsModel, productsModel) ||
                other.productsModel == productsModel) &&
            const DeepCollectionEquality()
                .equals(other._branchList, _branchList) &&
            const DeepCollectionEquality().equals(other._branch, _branch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusGetProductCategory,
      statusPostProductCategory,
      statusGetBranchs,
      message,
      const DeepCollectionEquality().hash(_productsList),
      productsModel,
      const DeepCollectionEquality().hash(_branchList),
      const DeepCollectionEquality().hash(_branch));

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
      final BlocStatus statusGetBranchs,
      final String? message,
      final List<WarehouseItemsModel>? productsList,
      final ProductsModel? productsModel,
      final List<BranchModel>? branchList,
      final List<String>? branch}) = _$ProductsStateImpl;
  const _ProductsState._() : super._();

  @override
  BlocStatus get statusGetProductCategory;
  @override
  BlocStatus get statusPostProductCategory;
  @override
  BlocStatus get statusGetBranchs;
  @override
  String? get message;
  @override
  List<WarehouseItemsModel>? get productsList;
  @override
  ProductsModel? get productsModel;
  @override
  List<BranchModel>? get branchList;
  @override
  List<String>? get branch;
  @override
  @JsonKey(ignore: true)
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

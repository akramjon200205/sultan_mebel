// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warehouse_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WarehouseState {
  BlocStatus get statusGetWarehouse => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<BranchModel>? get branchList => throw _privateConstructorUsedError;
  List<String>? get branchNames => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WarehouseStateCopyWith<WarehouseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarehouseStateCopyWith<$Res> {
  factory $WarehouseStateCopyWith(
          WarehouseState value, $Res Function(WarehouseState) then) =
      _$WarehouseStateCopyWithImpl<$Res, WarehouseState>;
  @useResult
  $Res call(
      {BlocStatus statusGetWarehouse,
      String? message,
      List<BranchModel>? branchList,
      List<String>? branchNames});
}

/// @nodoc
class _$WarehouseStateCopyWithImpl<$Res, $Val extends WarehouseState>
    implements $WarehouseStateCopyWith<$Res> {
  _$WarehouseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusGetWarehouse = null,
    Object? message = freezed,
    Object? branchList = freezed,
    Object? branchNames = freezed,
  }) {
    return _then(_value.copyWith(
      statusGetWarehouse: null == statusGetWarehouse
          ? _value.statusGetWarehouse
          : statusGetWarehouse // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      branchList: freezed == branchList
          ? _value.branchList
          : branchList // ignore: cast_nullable_to_non_nullable
              as List<BranchModel>?,
      branchNames: freezed == branchNames
          ? _value.branchNames
          : branchNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WarehouseStateImplCopyWith<$Res>
    implements $WarehouseStateCopyWith<$Res> {
  factory _$$WarehouseStateImplCopyWith(_$WarehouseStateImpl value,
          $Res Function(_$WarehouseStateImpl) then) =
      __$$WarehouseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus statusGetWarehouse,
      String? message,
      List<BranchModel>? branchList,
      List<String>? branchNames});
}

/// @nodoc
class __$$WarehouseStateImplCopyWithImpl<$Res>
    extends _$WarehouseStateCopyWithImpl<$Res, _$WarehouseStateImpl>
    implements _$$WarehouseStateImplCopyWith<$Res> {
  __$$WarehouseStateImplCopyWithImpl(
      _$WarehouseStateImpl _value, $Res Function(_$WarehouseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusGetWarehouse = null,
    Object? message = freezed,
    Object? branchList = freezed,
    Object? branchNames = freezed,
  }) {
    return _then(_$WarehouseStateImpl(
      statusGetWarehouse: null == statusGetWarehouse
          ? _value.statusGetWarehouse
          : statusGetWarehouse // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      branchList: freezed == branchList
          ? _value._branchList
          : branchList // ignore: cast_nullable_to_non_nullable
              as List<BranchModel>?,
      branchNames: freezed == branchNames
          ? _value._branchNames
          : branchNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$WarehouseStateImpl extends _WarehouseState {
  const _$WarehouseStateImpl(
      {this.statusGetWarehouse = BlocStatus.notInitialized,
      this.message,
      final List<BranchModel>? branchList,
      final List<String>? branchNames})
      : _branchList = branchList,
        _branchNames = branchNames,
        super._();

  @override
  @JsonKey()
  final BlocStatus statusGetWarehouse;
  @override
  final String? message;
  final List<BranchModel>? _branchList;
  @override
  List<BranchModel>? get branchList {
    final value = _branchList;
    if (value == null) return null;
    if (_branchList is EqualUnmodifiableListView) return _branchList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _branchNames;
  @override
  List<String>? get branchNames {
    final value = _branchNames;
    if (value == null) return null;
    if (_branchNames is EqualUnmodifiableListView) return _branchNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WarehouseState(statusGetWarehouse: $statusGetWarehouse, message: $message, branchList: $branchList, branchNames: $branchNames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WarehouseStateImpl &&
            (identical(other.statusGetWarehouse, statusGetWarehouse) ||
                other.statusGetWarehouse == statusGetWarehouse) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._branchList, _branchList) &&
            const DeepCollectionEquality()
                .equals(other._branchNames, _branchNames));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusGetWarehouse,
      message,
      const DeepCollectionEquality().hash(_branchList),
      const DeepCollectionEquality().hash(_branchNames));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WarehouseStateImplCopyWith<_$WarehouseStateImpl> get copyWith =>
      __$$WarehouseStateImplCopyWithImpl<_$WarehouseStateImpl>(
          this, _$identity);
}

abstract class _WarehouseState extends WarehouseState {
  const factory _WarehouseState(
      {final BlocStatus statusGetWarehouse,
      final String? message,
      final List<BranchModel>? branchList,
      final List<String>? branchNames}) = _$WarehouseStateImpl;
  const _WarehouseState._() : super._();

  @override
  BlocStatus get statusGetWarehouse;
  @override
  String? get message;
  @override
  List<BranchModel>? get branchList;
  @override
  List<String>? get branchNames;
  @override
  @JsonKey(ignore: true)
  _$$WarehouseStateImplCopyWith<_$WarehouseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

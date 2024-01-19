// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branches_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BranchesState {
  BlocStatus get statusBranchs => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<WereHouseModel>? get branchsList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BranchesStateCopyWith<BranchesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchesStateCopyWith<$Res> {
  factory $BranchesStateCopyWith(
          BranchesState value, $Res Function(BranchesState) then) =
      _$BranchesStateCopyWithImpl<$Res, BranchesState>;
  @useResult
  $Res call(
      {BlocStatus statusBranchs,
      String? message,
      List<WereHouseModel>? branchsList});
}

/// @nodoc
class _$BranchesStateCopyWithImpl<$Res, $Val extends BranchesState>
    implements $BranchesStateCopyWith<$Res> {
  _$BranchesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusBranchs = null,
    Object? message = freezed,
    Object? branchsList = freezed,
  }) {
    return _then(_value.copyWith(
      statusBranchs: null == statusBranchs
          ? _value.statusBranchs
          : statusBranchs // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      branchsList: freezed == branchsList
          ? _value.branchsList
          : branchsList // ignore: cast_nullable_to_non_nullable
              as List<WereHouseModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchesStateImplCopyWith<$Res>
    implements $BranchesStateCopyWith<$Res> {
  factory _$$BranchesStateImplCopyWith(
          _$BranchesStateImpl value, $Res Function(_$BranchesStateImpl) then) =
      __$$BranchesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus statusBranchs,
      String? message,
      List<WereHouseModel>? branchsList});
}

/// @nodoc
class __$$BranchesStateImplCopyWithImpl<$Res>
    extends _$BranchesStateCopyWithImpl<$Res, _$BranchesStateImpl>
    implements _$$BranchesStateImplCopyWith<$Res> {
  __$$BranchesStateImplCopyWithImpl(
      _$BranchesStateImpl _value, $Res Function(_$BranchesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusBranchs = null,
    Object? message = freezed,
    Object? branchsList = freezed,
  }) {
    return _then(_$BranchesStateImpl(
      statusBranchs: null == statusBranchs
          ? _value.statusBranchs
          : statusBranchs // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      branchsList: freezed == branchsList
          ? _value._branchsList
          : branchsList // ignore: cast_nullable_to_non_nullable
              as List<WereHouseModel>?,
    ));
  }
}

/// @nodoc

class _$BranchesStateImpl extends _BranchesState {
  const _$BranchesStateImpl(
      {this.statusBranchs = BlocStatus.notInitialized,
      this.message,
      final List<WereHouseModel>? branchsList})
      : _branchsList = branchsList,
        super._();

  @override
  @JsonKey()
  final BlocStatus statusBranchs;
  @override
  final String? message;
  final List<WereHouseModel>? _branchsList;
  @override
  List<WereHouseModel>? get branchsList {
    final value = _branchsList;
    if (value == null) return null;
    if (_branchsList is EqualUnmodifiableListView) return _branchsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BranchesState(statusBranchs: $statusBranchs, message: $message, branchsList: $branchsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchesStateImpl &&
            (identical(other.statusBranchs, statusBranchs) ||
                other.statusBranchs == statusBranchs) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._branchsList, _branchsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusBranchs, message,
      const DeepCollectionEquality().hash(_branchsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchesStateImplCopyWith<_$BranchesStateImpl> get copyWith =>
      __$$BranchesStateImplCopyWithImpl<_$BranchesStateImpl>(this, _$identity);
}

abstract class _BranchesState extends BranchesState {
  const factory _BranchesState(
      {final BlocStatus statusBranchs,
      final String? message,
      final List<WereHouseModel>? branchsList}) = _$BranchesStateImpl;
  const _BranchesState._() : super._();

  @override
  BlocStatus get statusBranchs;
  @override
  String? get message;
  @override
  List<WereHouseModel>? get branchsList;
  @override
  @JsonKey(ignore: true)
  _$$BranchesStateImplCopyWith<_$BranchesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

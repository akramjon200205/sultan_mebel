// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardState {
  BlocStatus get statusGetSales => throw _privateConstructorUsedError;
  BlocStatus get statusPostSales => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  SalesModel? get clientGet => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardStateCopyWith<CardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardStateCopyWith<$Res> {
  factory $CardStateCopyWith(CardState value, $Res Function(CardState) then) =
      _$CardStateCopyWithImpl<$Res, CardState>;
  @useResult
  $Res call(
      {BlocStatus statusGetSales,
      BlocStatus statusPostSales,
      String? message,
      SalesModel? clientGet});
}

/// @nodoc
class _$CardStateCopyWithImpl<$Res, $Val extends CardState>
    implements $CardStateCopyWith<$Res> {
  _$CardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusGetSales = null,
    Object? statusPostSales = null,
    Object? message = freezed,
    Object? clientGet = freezed,
  }) {
    return _then(_value.copyWith(
      statusGetSales: null == statusGetSales
          ? _value.statusGetSales
          : statusGetSales // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusPostSales: null == statusPostSales
          ? _value.statusPostSales
          : statusPostSales // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      clientGet: freezed == clientGet
          ? _value.clientGet
          : clientGet // ignore: cast_nullable_to_non_nullable
              as SalesModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardStateImplCopyWith<$Res>
    implements $CardStateCopyWith<$Res> {
  factory _$$CardStateImplCopyWith(
          _$CardStateImpl value, $Res Function(_$CardStateImpl) then) =
      __$$CardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus statusGetSales,
      BlocStatus statusPostSales,
      String? message,
      SalesModel? clientGet});
}

/// @nodoc
class __$$CardStateImplCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$CardStateImpl>
    implements _$$CardStateImplCopyWith<$Res> {
  __$$CardStateImplCopyWithImpl(
      _$CardStateImpl _value, $Res Function(_$CardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusGetSales = null,
    Object? statusPostSales = null,
    Object? message = freezed,
    Object? clientGet = freezed,
  }) {
    return _then(_$CardStateImpl(
      statusGetSales: null == statusGetSales
          ? _value.statusGetSales
          : statusGetSales // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusPostSales: null == statusPostSales
          ? _value.statusPostSales
          : statusPostSales // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      clientGet: freezed == clientGet
          ? _value.clientGet
          : clientGet // ignore: cast_nullable_to_non_nullable
              as SalesModel?,
    ));
  }
}

/// @nodoc

class _$CardStateImpl extends _CardState {
  const _$CardStateImpl(
      {this.statusGetSales = BlocStatus.notInitialized,
      this.statusPostSales = BlocStatus.notInitialized,
      this.message,
      this.clientGet})
      : super._();

  @override
  @JsonKey()
  final BlocStatus statusGetSales;
  @override
  @JsonKey()
  final BlocStatus statusPostSales;
  @override
  final String? message;
  @override
  final SalesModel? clientGet;

  @override
  String toString() {
    return 'CardState(statusGetSales: $statusGetSales, statusPostSales: $statusPostSales, message: $message, clientGet: $clientGet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardStateImpl &&
            (identical(other.statusGetSales, statusGetSales) ||
                other.statusGetSales == statusGetSales) &&
            (identical(other.statusPostSales, statusPostSales) ||
                other.statusPostSales == statusPostSales) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.clientGet, clientGet) ||
                other.clientGet == clientGet));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, statusGetSales, statusPostSales, message, clientGet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardStateImplCopyWith<_$CardStateImpl> get copyWith =>
      __$$CardStateImplCopyWithImpl<_$CardStateImpl>(this, _$identity);
}

abstract class _CardState extends CardState {
  const factory _CardState(
      {final BlocStatus statusGetSales,
      final BlocStatus statusPostSales,
      final String? message,
      final SalesModel? clientGet}) = _$CardStateImpl;
  const _CardState._() : super._();

  @override
  BlocStatus get statusGetSales;
  @override
  BlocStatus get statusPostSales;
  @override
  String? get message;
  @override
  SalesModel? get clientGet;
  @override
  @JsonKey(ignore: true)
  _$$CardStateImplCopyWith<_$CardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

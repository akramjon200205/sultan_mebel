// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ClientState {
  BlocStatus get statusGetClient => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  CustomerModel? get clientGet => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClientStateCopyWith<ClientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientStateCopyWith<$Res> {
  factory $ClientStateCopyWith(
          ClientState value, $Res Function(ClientState) then) =
      _$ClientStateCopyWithImpl<$Res, ClientState>;
  @useResult
  $Res call(
      {BlocStatus statusGetClient, String? message, CustomerModel? clientGet});
}

/// @nodoc
class _$ClientStateCopyWithImpl<$Res, $Val extends ClientState>
    implements $ClientStateCopyWith<$Res> {
  _$ClientStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusGetClient = null,
    Object? message = freezed,
    Object? clientGet = freezed,
  }) {
    return _then(_value.copyWith(
      statusGetClient: null == statusGetClient
          ? _value.statusGetClient
          : statusGetClient // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      clientGet: freezed == clientGet
          ? _value.clientGet
          : clientGet // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientStateImplCopyWith<$Res>
    implements $ClientStateCopyWith<$Res> {
  factory _$$ClientStateImplCopyWith(
          _$ClientStateImpl value, $Res Function(_$ClientStateImpl) then) =
      __$$ClientStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus statusGetClient, String? message, CustomerModel? clientGet});
}

/// @nodoc
class __$$ClientStateImplCopyWithImpl<$Res>
    extends _$ClientStateCopyWithImpl<$Res, _$ClientStateImpl>
    implements _$$ClientStateImplCopyWith<$Res> {
  __$$ClientStateImplCopyWithImpl(
      _$ClientStateImpl _value, $Res Function(_$ClientStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusGetClient = null,
    Object? message = freezed,
    Object? clientGet = freezed,
  }) {
    return _then(_$ClientStateImpl(
      statusGetClient: null == statusGetClient
          ? _value.statusGetClient
          : statusGetClient // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      clientGet: freezed == clientGet
          ? _value.clientGet
          : clientGet // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
    ));
  }
}

/// @nodoc

class _$ClientStateImpl extends _ClientState {
  const _$ClientStateImpl(
      {this.statusGetClient = BlocStatus.notInitialized,
      this.message,
      this.clientGet})
      : super._();

  @override
  @JsonKey()
  final BlocStatus statusGetClient;
  @override
  final String? message;
  @override
  final CustomerModel? clientGet;

  @override
  String toString() {
    return 'ClientState(statusGetClient: $statusGetClient, message: $message, clientGet: $clientGet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientStateImpl &&
            (identical(other.statusGetClient, statusGetClient) ||
                other.statusGetClient == statusGetClient) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.clientGet, clientGet) ||
                other.clientGet == clientGet));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, statusGetClient, message, clientGet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientStateImplCopyWith<_$ClientStateImpl> get copyWith =>
      __$$ClientStateImplCopyWithImpl<_$ClientStateImpl>(this, _$identity);
}

abstract class _ClientState extends ClientState {
  const factory _ClientState(
      {final BlocStatus statusGetClient,
      final String? message,
      final CustomerModel? clientGet}) = _$ClientStateImpl;
  const _ClientState._() : super._();

  @override
  BlocStatus get statusGetClient;
  @override
  String? get message;
  @override
  CustomerModel? get clientGet;
  @override
  @JsonKey(ignore: true)
  _$$ClientStateImplCopyWith<_$ClientStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

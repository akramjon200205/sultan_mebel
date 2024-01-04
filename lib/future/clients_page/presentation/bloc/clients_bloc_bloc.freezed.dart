// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clients_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ClientsBlocState {
  BlocStatus get statusClients => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<CustomerModel>? get clientsList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClientsBlocStateCopyWith<ClientsBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientsBlocStateCopyWith<$Res> {
  factory $ClientsBlocStateCopyWith(
          ClientsBlocState value, $Res Function(ClientsBlocState) then) =
      _$ClientsBlocStateCopyWithImpl<$Res, ClientsBlocState>;
  @useResult
  $Res call(
      {BlocStatus statusClients,
      String? message,
      List<CustomerModel>? clientsList});
}

/// @nodoc
class _$ClientsBlocStateCopyWithImpl<$Res, $Val extends ClientsBlocState>
    implements $ClientsBlocStateCopyWith<$Res> {
  _$ClientsBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusClients = null,
    Object? message = freezed,
    Object? clientsList = freezed,
  }) {
    return _then(_value.copyWith(
      statusClients: null == statusClients
          ? _value.statusClients
          : statusClients // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      clientsList: freezed == clientsList
          ? _value.clientsList
          : clientsList // ignore: cast_nullable_to_non_nullable
              as List<CustomerModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientsBlocStateImplCopyWith<$Res>
    implements $ClientsBlocStateCopyWith<$Res> {
  factory _$$ClientsBlocStateImplCopyWith(_$ClientsBlocStateImpl value,
          $Res Function(_$ClientsBlocStateImpl) then) =
      __$$ClientsBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus statusClients,
      String? message,
      List<CustomerModel>? clientsList});
}

/// @nodoc
class __$$ClientsBlocStateImplCopyWithImpl<$Res>
    extends _$ClientsBlocStateCopyWithImpl<$Res, _$ClientsBlocStateImpl>
    implements _$$ClientsBlocStateImplCopyWith<$Res> {
  __$$ClientsBlocStateImplCopyWithImpl(_$ClientsBlocStateImpl _value,
      $Res Function(_$ClientsBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusClients = null,
    Object? message = freezed,
    Object? clientsList = freezed,
  }) {
    return _then(_$ClientsBlocStateImpl(
      statusClients: null == statusClients
          ? _value.statusClients
          : statusClients // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      clientsList: freezed == clientsList
          ? _value._clientsList
          : clientsList // ignore: cast_nullable_to_non_nullable
              as List<CustomerModel>?,
    ));
  }
}

/// @nodoc

class _$ClientsBlocStateImpl extends _ClientsBlocState {
  const _$ClientsBlocStateImpl(
      {this.statusClients = BlocStatus.notInitialized,
      this.message,
      final List<CustomerModel>? clientsList})
      : _clientsList = clientsList,
        super._();

  @override
  @JsonKey()
  final BlocStatus statusClients;
  @override
  final String? message;
  final List<CustomerModel>? _clientsList;
  @override
  List<CustomerModel>? get clientsList {
    final value = _clientsList;
    if (value == null) return null;
    if (_clientsList is EqualUnmodifiableListView) return _clientsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClientsBlocState(statusClients: $statusClients, message: $message, clientsList: $clientsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientsBlocStateImpl &&
            (identical(other.statusClients, statusClients) ||
                other.statusClients == statusClients) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._clientsList, _clientsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusClients, message,
      const DeepCollectionEquality().hash(_clientsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientsBlocStateImplCopyWith<_$ClientsBlocStateImpl> get copyWith =>
      __$$ClientsBlocStateImplCopyWithImpl<_$ClientsBlocStateImpl>(
          this, _$identity);
}

abstract class _ClientsBlocState extends ClientsBlocState {
  const factory _ClientsBlocState(
      {final BlocStatus statusClients,
      final String? message,
      final List<CustomerModel>? clientsList}) = _$ClientsBlocStateImpl;
  const _ClientsBlocState._() : super._();

  @override
  BlocStatus get statusClients;
  @override
  String? get message;
  @override
  List<CustomerModel>? get clientsList;
  @override
  @JsonKey(ignore: true)
  _$$ClientsBlocStateImplCopyWith<_$ClientsBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
mixin _$ClientsState {
  BlocStatus get statusGetClients => throw _privateConstructorUsedError;
  BlocStatus get statusPostClients => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<CustomerModel>? get clientsList => throw _privateConstructorUsedError;
  CustomerModel? get clientPost => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClientsStateCopyWith<ClientsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientsStateCopyWith<$Res> {
  factory $ClientsStateCopyWith(
          ClientsState value, $Res Function(ClientsState) then) =
      _$ClientsStateCopyWithImpl<$Res, ClientsState>;
  @useResult
  $Res call(
      {BlocStatus statusGetClients,
      BlocStatus statusPostClients,
      String? message,
      List<CustomerModel>? clientsList,
      CustomerModel? clientPost});
}

/// @nodoc
class _$ClientsStateCopyWithImpl<$Res, $Val extends ClientsState>
    implements $ClientsStateCopyWith<$Res> {
  _$ClientsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusGetClients = null,
    Object? statusPostClients = null,
    Object? message = freezed,
    Object? clientsList = freezed,
    Object? clientPost = freezed,
  }) {
    return _then(_value.copyWith(
      statusGetClients: null == statusGetClients
          ? _value.statusGetClients
          : statusGetClients // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusPostClients: null == statusPostClients
          ? _value.statusPostClients
          : statusPostClients // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      clientsList: freezed == clientsList
          ? _value.clientsList
          : clientsList // ignore: cast_nullable_to_non_nullable
              as List<CustomerModel>?,
      clientPost: freezed == clientPost
          ? _value.clientPost
          : clientPost // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientsStateImplCopyWith<$Res>
    implements $ClientsStateCopyWith<$Res> {
  factory _$$ClientsStateImplCopyWith(
          _$ClientsStateImpl value, $Res Function(_$ClientsStateImpl) then) =
      __$$ClientsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus statusGetClients,
      BlocStatus statusPostClients,
      String? message,
      List<CustomerModel>? clientsList,
      CustomerModel? clientPost});
}

/// @nodoc
class __$$ClientsStateImplCopyWithImpl<$Res>
    extends _$ClientsStateCopyWithImpl<$Res, _$ClientsStateImpl>
    implements _$$ClientsStateImplCopyWith<$Res> {
  __$$ClientsStateImplCopyWithImpl(
      _$ClientsStateImpl _value, $Res Function(_$ClientsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusGetClients = null,
    Object? statusPostClients = null,
    Object? message = freezed,
    Object? clientsList = freezed,
    Object? clientPost = freezed,
  }) {
    return _then(_$ClientsStateImpl(
      statusGetClients: null == statusGetClients
          ? _value.statusGetClients
          : statusGetClients // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusPostClients: null == statusPostClients
          ? _value.statusPostClients
          : statusPostClients // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      clientsList: freezed == clientsList
          ? _value._clientsList
          : clientsList // ignore: cast_nullable_to_non_nullable
              as List<CustomerModel>?,
      clientPost: freezed == clientPost
          ? _value.clientPost
          : clientPost // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
    ));
  }
}

/// @nodoc

class _$ClientsStateImpl extends _ClientsState {
  const _$ClientsStateImpl(
      {this.statusGetClients = BlocStatus.notInitialized,
      this.statusPostClients = BlocStatus.notInitialized,
      this.message,
      final List<CustomerModel>? clientsList,
      this.clientPost})
      : _clientsList = clientsList,
        super._();

  @override
  @JsonKey()
  final BlocStatus statusGetClients;
  @override
  @JsonKey()
  final BlocStatus statusPostClients;
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
  final CustomerModel? clientPost;

  @override
  String toString() {
    return 'ClientsState(statusGetClients: $statusGetClients, statusPostClients: $statusPostClients, message: $message, clientsList: $clientsList, clientPost: $clientPost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientsStateImpl &&
            (identical(other.statusGetClients, statusGetClients) ||
                other.statusGetClients == statusGetClients) &&
            (identical(other.statusPostClients, statusPostClients) ||
                other.statusPostClients == statusPostClients) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._clientsList, _clientsList) &&
            (identical(other.clientPost, clientPost) ||
                other.clientPost == clientPost));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusGetClients,
      statusPostClients,
      message,
      const DeepCollectionEquality().hash(_clientsList),
      clientPost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientsStateImplCopyWith<_$ClientsStateImpl> get copyWith =>
      __$$ClientsStateImplCopyWithImpl<_$ClientsStateImpl>(this, _$identity);
}

abstract class _ClientsState extends ClientsState {
  const factory _ClientsState(
      {final BlocStatus statusGetClients,
      final BlocStatus statusPostClients,
      final String? message,
      final List<CustomerModel>? clientsList,
      final CustomerModel? clientPost}) = _$ClientsStateImpl;
  const _ClientsState._() : super._();

  @override
  BlocStatus get statusGetClients;
  @override
  BlocStatus get statusPostClients;
  @override
  String? get message;
  @override
  List<CustomerModel>? get clientsList;
  @override
  CustomerModel? get clientPost;
  @override
  @JsonKey(ignore: true)
  _$$ClientsStateImplCopyWith<_$ClientsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

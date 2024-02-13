part of 'client_bloc.dart';

@freezed
class ClientState with _$ClientState {
  const factory ClientState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusGetClient,    
 
    final String? message,    
    final CustomerModel? clientGet,

  }) = _ClientState;

  const ClientState._();
}
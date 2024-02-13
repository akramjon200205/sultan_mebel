part of 'client_bloc.dart';

@freezed
class ClientState with _$ClientState {
  const factory ClientState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusGetClient,    
    @Default(BlocStatus.notInitialized) final BlocStatus statusPatchClient,    
 
    final String? message,    
    final CustomerModel? clientGet,
    final CustomerModel? clientPatch,

  }) = _ClientState;

  const ClientState._();
}
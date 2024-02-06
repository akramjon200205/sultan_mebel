part of 'clients_bloc_bloc.dart';

@freezed
class ClientsState with _$ClientsState {
  const factory ClientsState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusGetClients,    
    @Default(BlocStatus.notInitialized) final BlocStatus statusPostClients,    
    final String? message,
    final List<CustomerModel>? clientsList,
    final CustomerModel? clientPost,

  }) = _ClientsState;

  const ClientsState._();
}

part of 'clients_bloc_bloc.dart';

@freezed
class ClientsBlocState with _$ClientsBlocState {
  const factory ClientsBlocState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusClients,    
    final String? message,
    final List<CustomerModel>? clientsList,

  }) = _ClientsBlocState;

  const ClientsBlocState._();
}

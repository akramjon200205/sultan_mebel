// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'clients_bloc_bloc.dart';

class ClientsBlocEvent extends Equatable {
  const ClientsBlocEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ClientsPostEvent extends ClientsBlocEvent {
  String? firstName;
  String? lastName;
  String? phone;
  String? address;

  ClientsPostEvent(
   { this.firstName,
    this.lastName,
    this.phone,
    this.address,}
  );

  @override
  List<Object> get props => [];
}

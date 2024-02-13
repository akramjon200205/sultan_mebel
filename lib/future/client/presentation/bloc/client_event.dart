// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'client_bloc.dart';

class ClientEvent extends Equatable {
  final int? id;
  const ClientEvent(
    this.id,
  );

  @override
  List<Object> get props => [id!];
}

class ClientPatchEvent extends ClientEvent {
  int? idClient;
  double? loan;
  String? lastName;
  String? firstName;
  String? phone;
  String? address;
  ClientPatchEvent(
    this.idClient,
    this.loan,
    this.lastName,
    this.firstName,
    this.phone,
    this.address,
  ) : super(idClient);
}

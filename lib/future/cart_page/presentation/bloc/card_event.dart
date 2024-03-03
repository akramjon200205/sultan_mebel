// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'card_bloc.dart';

class CardEvent extends Equatable {
  const CardEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CardClientsPostEvent extends CardEvent {
  List<Map<String, dynamic>> itemsList;
  double price;
  String commentClient;
  int customer;
  int branch;
  CardClientsPostEvent(
    this.itemsList,
    this.price,
    this.commentClient,
    this.customer,
    this.branch,
  );
}

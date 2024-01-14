// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class HomePostEvent extends HomeEvent {
  final String categoryName;

  const HomePostEvent({
    required this.categoryName,
  });
}

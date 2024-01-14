part of 'login_bloc.dart';

 class LoginEvent extends Equatable {
  const LoginEvent();



  @override
  List<Object> get props => [];
}
class LoginUserEvent extends LoginEvent{
  final String number, password;
  const LoginUserEvent({required this.number,required this.password});

}
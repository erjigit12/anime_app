part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AutheticationUserChanged extends AuthenticationEvent {
  final User? user;

  const AutheticationUserChanged(this.user);
}

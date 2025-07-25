part of 'auth_cubit.dart';

abstract class AuthState {
  final String? errMessage;
  final Session? authSession;

  const AuthState({
    this.errMessage,
    this.authSession
  });
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final Session authSession;

  const AuthSuccess({required this.authSession}) : super(authSession: authSession);
}

class AuthFailure extends AuthState {
  final String errMessage;

  const AuthFailure({required this.errMessage}) : super(errMessage: errMessage);
}
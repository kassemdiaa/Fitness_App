part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {
  final String? token;
  Authenticated({required this.token});
}

final class UnAuthenticated extends AuthState {
  final String Message;
  UnAuthenticated({required this.Message});
}

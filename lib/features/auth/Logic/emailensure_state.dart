part of 'emailensure_cubit.dart';
@immutable
sealed class EmailensureState {}
final class EmailensureInitial extends EmailensureState {}
final class Emailensureloading extends EmailensureState {}
final class Emailwrong extends EmailensureState {
  final String message;
  Emailwrong({required this.message});
}
final class RightEmail extends EmailensureState{
  final String token;
  RightEmail({required this.token});
}


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
final class PhoneOtpcorrect extends EmailensureState{
  final String otp;
  PhoneOtpcorrect({required this.otp});
}
final class PhoneOtpWrong extends EmailensureState{
  final String error;
  PhoneOtpWrong({required this.error});
}


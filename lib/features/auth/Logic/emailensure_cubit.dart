import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'emailensure_state.dart';

class EmailensureCubit extends Cubit<EmailensureState> {
  EmailensureCubit() : super(EmailensureInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> verifyEmail(String email) async {
    emit(Emailensureloading());
    try {
      await _auth.sendPasswordResetEmail(email: email);
      emit(RightEmail(token: email));
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'user-not-found') {
        errorMessage = "Doesn't Exist";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Invalid email";
      } else if (e.code == 'too-many-requests') {
        errorMessage = "Too Many requests";
      } else {
        errorMessage = e.message ?? 'Something went wrong';
      }
      emit(Emailwrong(message: errorMessage));
    } catch (e) {
      emit(Emailwrong(message: e.toString()));
    }
  }

  Future<void> otpSend(String otp) async {
    emit(Emailensureloading());
    try {
      await _auth.verifyPasswordResetCode(otp);
      emit(PhoneOtpcorrect(otp: otp));
    } on FirebaseAuthException catch (e) {
      emit(PhoneOtpWrong(error: e.toString()));
    } catch (e) {
      emit(PhoneOtpWrong(error: e.toString()));
    }
  }
}
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'emailensure_state.dart';

class EmailensureCubit extends Cubit<EmailensureState> {
  EmailensureCubit() : super(EmailensureInitial());
  final FirebaseAuth _auth= FirebaseAuth.instance;
  Future<void>VerifyEmail(String email)async{
    emit(Emailensureloading());
    try{
      await _auth.sendPasswordResetEmail(email: email);
      emit(RightEmail(token: email));
    }on FirebaseAuthException catch(e){
      String ErrorMessage=' ';
      if(e.code == 'user-not-found'){
        ErrorMessage="Doesn't Exist";
      } else if (e.code == 'invalid-email') {
        ErrorMessage = "Invaild email";
      } else if (e.code == 'too-many-requests') {
        ErrorMessage = "Too Many requests";
      }
      emit(Emailwrong(message: ErrorMessage));
    }catch(e){
      emit(Emailwrong(message: e.toString()));
    }
  }
}

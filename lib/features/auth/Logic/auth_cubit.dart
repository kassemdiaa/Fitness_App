import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> SignUP(String email, String password) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      String? token = await userCredential.user?.getIdToken();
      emit(Authenticated(token: token));
    } on FirebaseAuthException catch (e) {
      emit(UnAuthenticated(Message: "$e"));
    } catch (e) {
      emit(UnAuthenticated(Message: "$e"));
    }
  }

  Future<void> logIn(String email, String password) async {
  emit(AuthLoading());
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    String? token = await userCredential.user?.getIdToken();
    if (token == null) {
      emit(UnAuthenticated( Message: 'Failed to get token'));
      return null;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

    emit(Authenticated(token: token));

  } on FirebaseAuthException catch (e) {
    emit(UnAuthenticated(Message: e.message ?? "Authentication failed"));
  } catch (e) {
    emit(UnAuthenticated(Message: "Unexpected error: $e"));
  }
}
}

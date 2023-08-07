import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginuser(
      {required String Email, required String Password}) async {
    // var auth = FirebaseAuth.instance;
    try {
      emit(Loginloading());
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: Email, password: Password);
      emit(LoginIsuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'usef not found') {
        emit(Loginfailure( errorMessage: 'usef not found'));
      } else if (e.code == 'wrong_password') {
        emit(Loginfailure(errorMessage: 'wrong_password'));
      }
    } catch (e) {
      emit(Loginfailure( errorMessage:'Something wenr wrong'));
    }
  }
}

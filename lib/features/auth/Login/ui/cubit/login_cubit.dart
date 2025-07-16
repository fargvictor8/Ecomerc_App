import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final TextEditingController emilController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final FirebaseAuth auth = FirebaseAuth.instance;
bool obscureText = true;

void toggleobscureText(){
  obscureText = !obscureText;

  emit(LoginInitial());
}
//      final credential =
  void login() async{
      if(formkey.currentState?.validate() == true){
        emit(LoginLoading());

        try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emilController.text,
              password: passwordController.text
          );
     emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          }
          emit(LoginError(
            message: e.message ?? "An Error Occourred durring Login"
          ));
        } catch(e){
          emit(LoginError(
              message: e.toString()
          ));
        }
      }
  }
}

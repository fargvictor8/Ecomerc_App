import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController emilController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

bool obscureText = true;
  bool obscureText2 = true;

void toggleobscureText(){
  obscureText = !obscureText;

  emit(SignUpInitial());
}

  void toggleobscureText2(){
    obscureText2 = !obscureText2;

    emit(SignUpInitial());
  }


  void signup() async{
      if(formkey.currentState?.validate() == true){
        emit(SignUpLoading());
        if(passwordController.text != confirmpasswordController.text){
          emit(SignUpError(message: "Password do not match"));
          print("Password do not match");
          return;
        }
        try {
          await auth.createUserWithEmailAndPassword(
            email: emilController.text,
            password: passwordController.text,
          );
          emit(SignUpSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
          emit(SignUpError(message: e.code));
        } catch (e) {
          emit(SignUpError(message: e.toString()));
          print(e);
        }
      }
  }
}

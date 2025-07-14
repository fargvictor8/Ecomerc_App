import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final TextEditingController emilController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

bool obscureText = true;

void toggleobscureText(){
  obscureText = !obscureText;

  emit(SignUpInitial());
}

  void login(){
      if(formkey.currentState?.validate() == true){
        emit(SignUpSuccess());
      }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final TextEditingController emilController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

bool obscureText = true;

void toggleobscureText(){
  obscureText = !obscureText;

  emit(LoginInitial());
}

  void login(){
      if(formkey.currentState?.validate() == true){
        emit(LoginSuccess());
      }
  }
}

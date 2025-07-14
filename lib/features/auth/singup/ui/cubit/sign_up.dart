import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

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


  void signup(){
      if(formkey.currentState?.validate() == true){
        emit(SignUpSuccess());
      }
  }
}

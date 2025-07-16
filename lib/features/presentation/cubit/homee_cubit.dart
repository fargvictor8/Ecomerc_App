import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'homee_state.dart';

class HomeeCubit extends Cubit<HomeeState> {
  HomeeCubit() : super(HomeeInitial());

  final FirebaseAuth auth = FirebaseAuth.instance;

  void getData() {
    emit(HomeLoading());

    final user = auth.currentUser;

    if (user != null){
      print(user.email);
      emit(HomeeSuccess(user));
    }else{
      emit(HomeeError("User Not Found"));
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_methode/logic/cubit/states/login_state/login_state.dart';

class LogInCubit extends Cubit<LogINStates> {
  LogInCubit() : super(IntialLogInState());

  static LogInCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginToEmailLoadingstate());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit(LoginToEmailSucsessstate(value.user!.uid));
    }).catchError((error) {
      emit(LoginToEmailErrorstate(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassowrdshow = true;
  void changePasswordVisibilaty() {
    isPassowrdshow = !isPassowrdshow;
    suffix = isPassowrdshow
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(LoginChangePasswordVisibilatystate());
  }
}

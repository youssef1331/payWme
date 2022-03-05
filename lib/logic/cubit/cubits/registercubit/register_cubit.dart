// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_methode/data/usermodel/user_model.dart';
import 'package:payment_methode/logic/cubit/states/registerstate/register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(IntialRegisterState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  final codeController = TextEditingController();

  IconData sufix = Icons.visibility_off_outlined;
  bool isPasswordshowen = true;
  void changePasswordVisibilty() {
    isPasswordshowen = !isPasswordshowen;
    sufix = isPasswordshowen
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(RegisterChangePasswordVisibiltyState());
  }

  Future userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(RegisterLaodingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(
        name: name,
        email: email,
        phone: phone,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(RegisterCreateUserSucessfuly());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorInCreateUser(error.toString()));
    });
  }
}

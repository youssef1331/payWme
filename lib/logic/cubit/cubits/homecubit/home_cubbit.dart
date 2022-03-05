// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_methode/data/usermodel/user_model.dart';
import 'package:payment_methode/logic/cubit/states/homestate/home_state.dart';
import 'package:payment_methode/presentation/screens/home/home.dart';
import 'package:payment_methode/presentation/screens/recites/recites.dart';
import 'package:payment_methode/presentation/screens/wallet/wallet.dart';
import 'package:payment_methode/presentation/shared/local/constance.dart';
import '../../../../globals.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;
  void getUserData() {
    emit(HomeUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(HomeGetUserDataSucsessfulyState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeGetUserDataErrorState(error.toString()));
    });
  }

  int currentIndex = 0;

  List<Widget> bottomScreen = [
    const HomeScreen(),
    const Wallet(),
    const Recites(),
  ];
  void changeBottom(int index) {
    currentIndex = index;
    emit(HomeChangeBottomSheetSucess());
  }

  //SERVCIES CUBIT THINGS
  int? indexOfServices;
  static List<String> appBarTitle = [
    'Phone',
    'Water',
    'Gas',
    'Electric',
    'landing',
    'internt',
  ];
  static void changeAppBarTitleOfServcies(text) {
    Global.indexOfServices = appBarTitle.indexOf(text);
    print(Global.indexOfServices);
    // emit(HomeChangeServciesAppBarTitleSucess());
  }
}

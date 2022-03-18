import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_methode/logic/bloc_observer/bloc_observer.dart';
import 'package:payment_methode/logic/cubit/cubits/homecubit/home_cubbit.dart';
import 'package:payment_methode/presentation/screens/layout/layout.dart';
import 'package:payment_methode/presentation/screens/onboarding/onboarding.dart';
import 'package:payment_methode/presentation/screens/typesOfAccount/typeofaccount.dart';
import 'package:payment_methode/presentation/shared/local/constance.dart';
import 'package:payment_methode/presentation/shared/remote/cache_helper.dart';
import 'package:payment_methode/presentation/shared/style/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Widget? screSt;

  late bool? onboarding = CacheHelper.getData(key: 'onboarding');
  uId = CacheHelper.getData(key: 'uId');
  if (onboarding != null) {
    if (uId != null) {
      screSt = const LayoutScreen();
    } else {
      screSt = const TypesOfAccoun();
    }
  } else {
    screSt = const OnBoarding();
  }

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(startScreen: screSt!));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget startScreen;
  const MyApp({Key? key, required this.startScreen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getUserData(),
      child: MaterialApp(
        title: 'PayMent',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: startScreen,
      ),
    );
  }
}

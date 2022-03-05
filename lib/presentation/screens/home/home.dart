// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_methode/logic/cubit/cubits/homecubit/home_cubbit.dart';
import 'package:payment_methode/logic/cubit/states/homestate/home_state.dart';
import 'package:payment_methode/presentation/screens/navdrawer/nav_drawer.dart';
import 'package:payment_methode/presentation/widget/servicesButton/servciesbutton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/home/homepage.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Scaffold(
                key: scaffoldKey,
                backgroundColor: Colors.transparent,
                drawer: const NavDrawer(),
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => scaffoldKey.currentState?.openDrawer(),
                    icon: const Icon(Icons.sort),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Color.fromRGBO(22, 27, 83, 1),
                    statusBarIconBrightness: Brightness.light,
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 140),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            ServicesButton(
                              image: 'assets/images/home/phone.png',
                              text: 'Phone',
                            ),
                            Spacer(),
                            ServicesButton(
                              image: 'assets/images/home/water.png',
                              text: 'Water',
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            ServicesButton(
                              image: 'assets/images/home/gas.png',
                              text: 'Gas',
                            ),
                            const Spacer(),
                            ServicesButton(
                              image: 'assets/images/home/electric.png',
                              text: 'Electric',
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            ServicesButton(
                              image: 'assets/images/home/water.png',
                              text: 'landing',
                            ),
                            const Spacer(),
                            ServicesButton(
                              image: 'assets/images/home/gas.png',
                              text: 'internt',
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

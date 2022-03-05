import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:payment_methode/logic/cubit/cubits/homecubit/home_cubbit.dart';
import 'package:payment_methode/logic/cubit/states/homestate/home_state.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: cubit.bottomScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottom(index);
              },
              selectedItemColor: const Color.fromRGBO(0, 59, 117, 1),
              unselectedItemColor: Colors.grey,
              iconSize: 26,
              enableFeedback: true,
              selectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(MdiIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Linecons.wallet),
                  label: 'Wallet',
                ),
                BottomNavigationBarItem(
                  icon: Icon(MdiIcons.receipt),
                  label: 'Recites',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

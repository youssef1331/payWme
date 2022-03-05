import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_methode/logic/cubit/cubits/homecubit/home_cubbit.dart';
import 'package:payment_methode/logic/cubit/states/homestate/home_state.dart';
import 'package:payment_methode/presentation/shared/local/constance.dart';
import 'package:payment_methode/presentation/widget/Buttons/elvated_button.dart';

import '../../../globals.dart';

class Servcies extends StatelessWidget {
  const Servcies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var codeController = TextEditingController();
    var companyController = TextEditingController();
    var amountController = TextEditingController();
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: mostUsedColor),
              title: Text(
                HomeCubit.appBarTitle[Global.indexOfServices!].toString(),
                // 'Services Name',
                style: TextStyle(
                  color: mostUsedColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SERVCIES CODE
                      Text(
                        '${HomeCubit.appBarTitle[Global.indexOfServices!].toString()} Code :',
                        style: TextStyle(
                          color: mostUsedColor,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: codeController,
                        decoration: InputDecoration(
                          hintText: 'Enter Your code',
                          hintStyle: TextStyle(color: mostUsedColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      //SERVCEIS COMPANY
                      Text(
                        '${HomeCubit.appBarTitle[Global.indexOfServices!].toString()} Company :',
                        style: TextStyle(
                          color: mostUsedColor,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: companyController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      //SERVCIES AMOUNT
                      Text(
                        ' Amount :',
                        style: TextStyle(
                          color: mostUsedColor,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: amountController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      SizedBox(
                        height: 60,
                        child: DefaultElevatedButton(
                          pressed: () {},
                          text: 'Process',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

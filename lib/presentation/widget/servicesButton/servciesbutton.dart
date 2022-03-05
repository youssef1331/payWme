import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_methode/logic/cubit/cubits/homecubit/home_cubbit.dart';
import 'package:payment_methode/logic/cubit/states/homestate/home_state.dart';
import 'package:payment_methode/presentation/screens/services/services.dart';
import 'package:payment_methode/presentation/widget/navigattion/navigation.dart';

class ServicesButton extends StatelessWidget {
  const ServicesButton({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        child: BlocProvider(
          create: (context) => HomeCubit(),
          child: BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  navigatTo(context, const Servcies());
                  HomeCubit.changeAppBarTitleOfServcies(text);
                },
                child: Stack(
                  children: [
                    Container(
                      width: 135,
                      height: 135,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.5),
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(30, 36, 110, 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 105,
                            child: Image(
                              image: AssetImage(
                                image,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          // const SizedBox(height: 5),
                          Text(
                            text,
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        curve: Curves.fastOutSlowIn,
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(seconds: 4),
        builder: (context, double _val, Widget? child) {
          return Opacity(
            opacity: _val,
            child: Padding(
              padding: EdgeInsets.only(top: _val * 4),
              child: child,
            ),
          );
        });
  }
}

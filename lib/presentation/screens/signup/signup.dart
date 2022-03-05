// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:payment_methode/logic/cubit/cubits/registercubit/register_cubit.dart';
import 'package:payment_methode/logic/cubit/states/registerstate/register_state.dart';
import 'package:payment_methode/presentation/screens/layout/layout.dart';
import 'package:payment_methode/presentation/screens/login/login.dart';
import 'package:payment_methode/presentation/shared/local/constance.dart';
import 'package:payment_methode/presentation/widget/Buttons/elvated_button.dart';
import 'package:payment_methode/presentation/widget/Buttons/text_button.dart';
import 'package:payment_methode/presentation/widget/form_field_text/text_form_field.dart';
import 'package:payment_methode/presentation/widget/navigattion/navigation.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fomKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterCreateUserSucessfuly) {
            navigatTo(context, const LayoutScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('SignUp', style: TextStyle(color: mostUsedColor)),
              centerTitle: true,
              iconTheme: IconThemeData(color: mostUsedColor),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: fomKey,
                    child: Column(
                      children: [
                        DefaultFormField(
                          controller: nameController,
                          validate: (value) {
                            if (value.isEmpty || value == null) {
                              return 'Name Can\'t be Empty';
                            }
                          },
                          type: TextInputType.name,
                          label: const Text('Name'),
                          hint: 'Enter Your Name',
                          preIcon: Icons.person,
                        ),
                        const SizedBox(height: 25),
                        DefaultFormField(
                          controller: emailController,
                          validate: (value) {
                            Pattern pattern =
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?)*$";
                            RegExp regExp = RegExp(pattern.toString());
                            if (value.isEmpty || value == null) {
                              return 'Email Can\'t be Empty';
                            }
                            if (!regExp.hasMatch(value)) {
                              return 'Please Enter valid Email';
                            }
                          },
                          type: TextInputType.emailAddress,
                          label: const Text('Email'),
                          hint: 'Enter Your Email',
                          preIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 25),
                        DefaultFormField(
                            controller: phoneController,
                            validate: (value) {
                              if (value.isEmpty || value == null) {
                                return 'Phone Can\'t be Empty';
                              }
                            },
                            type: TextInputType.phone,
                            label: const Text('Phone'),
                            hint: 'Enter Your Phone',
                            preIcon: Icons.phone_iphone_outlined),
                        const SizedBox(height: 25),
                        DefaultFormField(
                          controller: passwordController,
                          validate: (value) {
                            if (value.isEmpty || value == null) {
                              return 'Password Can\'t be Empty';
                            } else if (value.length < 8) {
                              return 'Please Enter a Strong Password';
                            }
                          },
                          type: TextInputType.text,
                          label: const Text('Password'),
                          hint: 'Enter Your Password',
                          preIcon: Icons.lock_outline,
                          sufIcon: RegisterCubit.get(context).sufix,
                          isPasswored:
                              RegisterCubit.get(context).isPasswordshowen,
                          sufixPressed: RegisterCubit.get(context)
                              .changePasswordVisibilty,
                        ),
                        const SizedBox(height: 40),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (context) =>
                              state is! RegisterLaodingState,
                          widgetBuilder: (context) {
                            return DefaultElevatedButton(
                              pressed: () {
                                if (fomKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              text: 'SignUp',
                            );
                          },
                          fallbackBuilder: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('have An Account ?'),
                            CustomeTButton(
                              pressed: () {
                                navigatTo(context, const LogIn());
                              },
                              text: 'LogIn',
                            ),
                          ],
                        ),
                      ],
                    ),
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

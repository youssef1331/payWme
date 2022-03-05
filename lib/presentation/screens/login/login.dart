import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:payment_methode/logic/cubit/cubits/login_cubit/login_cubit.dart';
import 'package:payment_methode/logic/cubit/states/login_state/login_state.dart';
import 'package:payment_methode/presentation/screens/layout/layout.dart';
import 'package:payment_methode/presentation/screens/login/resetpassword.dart';
import 'package:payment_methode/presentation/screens/signup/signup.dart';
import 'package:payment_methode/presentation/shared/remote/cache_helper.dart';
import 'package:payment_methode/presentation/widget/Buttons/elvated_button.dart';
import 'package:payment_methode/presentation/widget/Buttons/text_button.dart';
import 'package:payment_methode/presentation/widget/form_field_text/text_form_field.dart';
import 'package:payment_methode/presentation/widget/navigattion/navigation.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LogInCubit(),
      child: BlocConsumer<LogInCubit, LogINStates>(
        listener: (context, state) {
          if (state is LoginToEmailSucsessstate) {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              navigateAndFinsh(context, const LayoutScreen());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage(
                            'assets/images/login/login.jpg',
                          ),
                        ),
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
                              return 'Please Enter Availd Email';
                            } else {
                              return null;
                            }
                          },
                          type: TextInputType.emailAddress,
                          label: const Text('Email'),
                          hint: 'Enter Your Email',
                          preIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 25.0),
                        DefaultFormField(
                          controller: passwordController,
                          validate: (value) {
                            if (value.isEmpty || value == null) {
                              return 'Password Can\'t be Empty';
                            }
                          },
                          type: TextInputType.visiblePassword,
                          label: const Text('Password'),
                          hint: 'Enter Your Password',
                          preIcon: Icons.lock_outline,
                          sufIcon: LogInCubit.get(context).suffix,
                          isPasswored: LogInCubit.get(context).isPassowrdshow,
                          sufixPressed: () {
                            LogInCubit.get(context).changePasswordVisibilaty();
                          },
                          onsubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              return;
                            } else {
                              LogInCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                        ),
                        Row(
                          children: [
                            const Text(
                              'ForgetPassword ?',
                            ),
                            CustomeTButton(
                              pressed: () {
                                navigatTo(context, const ResetPassword());
                              },
                              text: 'Resetnow!',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (context) =>
                              state is! LoginToEmailLoadingstate,
                          widgetBuilder: (context) => DefaultElevatedButton(
                            pressed: () {
                              if (formKey.currentState!.validate()) {
                                LogInCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'LogIn',
                          ),
                          fallbackBuilder: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t Have An Account?',
                            ),
                            CustomeTButton(
                                pressed: () {
                                  navigatTo(context, const SignUp());
                                },
                                text: 'Signup')
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

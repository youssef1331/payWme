import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_methode/logic/cubit/cubits/login_cubit/login_cubit.dart';
import 'package:payment_methode/logic/cubit/states/login_state/login_state.dart';
import 'package:payment_methode/presentation/screens/company_signup/company_signup.dart';
import 'package:payment_methode/presentation/screens/home/home_company.dart';
import 'package:payment_methode/presentation/screens/layout/layout.dart';
import 'package:payment_methode/presentation/screens/pesonalLogIn/reset_password_user.dart';
import 'package:payment_methode/presentation/shared/remote/cache_helper.dart';
import 'package:payment_methode/presentation/widget/Buttons/elvated_button.dart';
import 'package:payment_methode/presentation/widget/Buttons/text_button.dart';
import 'package:payment_methode/presentation/widget/form_field_text/text_form_field.dart';
import 'package:payment_methode/presentation/widget/navigattion/navigation.dart';

class CompanyLogin extends StatelessWidget {
  const CompanyLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _emailforCompany = TextEditingController();
    var _passwordforCompany = TextEditingController();
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
                        const Hero(
                          tag: 'company',
                          child: Image(
                            image: AssetImage(
                              'assets/images/login/company.png',
                            ),
                          ),
                        ),
                        DefaultFormField(
                          controller: _emailforCompany,
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
                          controller: _passwordforCompany,
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
                                email: _emailforCompany.text,
                                password: _passwordforCompany.text,
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
                        DefaultElevatedButton(
                          pressed: () {
                            navigatTo(
                              context,
                              const CompanyHome(),
                            );
                          },
                          text: 'LogIn',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t Have An Account?',
                            ),
                            CustomeTButton(
                                pressed: () {
                                  navigatTo(context, const CompanySignUp());
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

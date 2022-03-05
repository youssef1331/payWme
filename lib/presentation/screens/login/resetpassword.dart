// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:payment_methode/presentation/screens/login/login.dart';

import 'package:payment_methode/presentation/shared/local/constance.dart';
import 'package:payment_methode/presentation/widget/Buttons/elvated_button.dart';
import 'package:payment_methode/presentation/widget/form_field_text/text_form_field.dart';
import 'package:payment_methode/presentation/widget/navigattion/navigation.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _emailresetPassword = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mostUsedColor),
        title: Text(
          'Reset your password',
          style: TextStyle(
            color: mostUsedColor,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/images/login/Forgot password.png'),
                ),
                const SizedBox(height: 45),
                DefaultFormField(
                  controller: _emailresetPassword,
                  validate: (value) {
                    if (value.isEmpty || value == null) {
                      return 'Email Can\'t be Empty';
                    }
                  },
                  type: TextInputType.emailAddress,
                  label: Text('Email', style: TextStyle(color: mostUsedColor)),
                  hint: 'Your Email',
                  preIcon: Icons.email_outlined,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 55,
                  child: DefaultElevatedButton(
                    pressed: () {
                      if (_formKey.currentState!.validate()) {
                        try {
                          FirebaseAuth.instance.sendPasswordResetEmail(
                              email: _emailresetPassword.text);
                          showAndroidToast(
                            child: const Text('Email send'),
                            context: context,
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 2),
                            padding: const EdgeInsets.all(20),
                          );
                          navigateAndFinsh(context, const LogIn());
                        } on FirebaseException catch (e) {
                          print(e);
                          showAndroidToast(
                            child: Text(e.message!),
                            context: context,
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 2),
                            padding: const EdgeInsets.all(20),
                          );
                        }
                      }
                    },
                    text: 'Send',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

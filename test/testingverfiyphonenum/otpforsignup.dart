import 'package:flutter/material.dart';
import 'package:payment_methode/presentation/shared/local/constance.dart';
import 'package:payment_methode/presentation/widget/Buttons/elvated_button.dart';
import 'package:payment_methode/presentation/widget/form_field_text/text_form_field.dart';

class OtpForSignUp extends StatelessWidget {
  const OtpForSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otpController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Your Otp',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: mostUsedColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  DefaultFormField(
                    controller: otpController,
                    validate: (value) {
                      if (value.isEmpty || value == null) {
                        return 'otp fialed';
                      }
                      return null;
                    },
                    type: TextInputType.name,
                    label: const Text('Otp'),
                    hint: 'Enter Your Otp',
                    preIcon: Icons.vpn_key_outlined,
                  ),
                  const SizedBox(height: 25),
                  DefaultElevatedButton(
                    pressed: () {},
                    text: 'Verifiy',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

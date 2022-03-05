import 'package:flutter/material.dart';
import 'package:payment_methode/presentation/shared/local/constance.dart';
import 'package:payment_methode/presentation/widget/Buttons/elvated_button.dart';
import 'package:payment_methode/presentation/widget/form_field_text/text_form_field.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _codeController = TextEditingController();
    var _newPassController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mostUsedColor),
        title: Text(
          'new Password',
          style: TextStyle(
            color: mostUsedColor,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DefaultFormField(
                  controller: _codeController,
                  validate: (value) {
                    if (value.isEmpty || value == null) {
                      return 'Code can not be empty';
                    }
                  },
                  type: TextInputType.number,
                  label: const Text('Your Code'),
                  hint: '******',
                ),
                const SizedBox(height: 35),
                DefaultFormField(
                  controller: _newPassController,
                  validate: (value) {
                    if (value.isEmpty || value == null) {
                      return 'Password Can\'t be Empty';
                    } else if (value.length < 8) {
                      return 'Please Enter a Strong Password';
                    }
                  },
                  type: TextInputType.number,
                  label: const Text('New Passowrd'),
                  hint: '******',
                ),
                const SizedBox(height: 35),
                DefaultFormField(
                  controller: _newPassController,
                  validate: (value) {
                    if (value.isEmpty || value == null) {
                      return 'Password Can\'t be Empty';
                    } else if (value.length < 8) {
                      return 'Please Enter a Strong Password';
                    }
                  },
                  type: TextInputType.number,
                  label: const Text('Confirm Passowrd'),
                  hint: '******',
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 55,
                  child: DefaultElevatedButton(
                    pressed: () {},
                    text: 'Confirm',
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

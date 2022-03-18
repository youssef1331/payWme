import 'package:flutter/material.dart';
import 'package:payment_methode/presentation/shared/local/constance.dart';
import 'package:payment_methode/presentation/widget/Buttons/elvated_button.dart';
import 'package:payment_methode/presentation/widget/form_field_text/text_form_field.dart';

class CompanySignUp extends StatelessWidget {
  const CompanySignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _companyName = TextEditingController();
    var _companyEmail = TextEditingController();
    var _companyCommercialRegister = TextEditingController();
    var _companyTaxCard = TextEditingController();
    var _companyBankAccount = TextEditingController();
    var _companyMainCurrency = TextEditingController();
    var _companyPersonalId = TextEditingController();
    var _companyIbanNumber = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mostUsedColor),
        title: Text(
          'Company SignUp',
          style: TextStyle(
            color: mostUsedColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DefaultFormField(
                controller: _companyName,
                validate: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Password Can\'t be Empty';
                  }
                },
                type: TextInputType.name,
                label: Text(
                  'Company Name',
                  style: TextStyle(
                    color: mostUsedColor,
                  ),
                ),
                hint: 'joo',
              ),
              const SizedBox(height: 15),
              DefaultFormField(
                controller: _companyEmail,
                validate: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Password Can\'t be Empty';
                  }
                },
                type: TextInputType.emailAddress,
                label: Text(
                  'Company Email',
                  style: TextStyle(
                    color: mostUsedColor,
                  ),
                ),
                hint: 'joo@gmail.com',
              ),
              const SizedBox(height: 15),
              DefaultFormField(
                controller: _companyCommercialRegister,
                validate: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Password Can\'t be Empty';
                  }
                },
                type: TextInputType.name,
                label: Text(
                  'Commercial Register',
                  style: TextStyle(
                    color: mostUsedColor,
                  ),
                ),
                hint: '******',
              ),
              const SizedBox(height: 15),
              DefaultFormField(
                controller: _companyTaxCard,
                validate: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Password Can\'t be Empty';
                  }
                },
                type: TextInputType.number,
                label: Text(
                  'Tax Card',
                  style: TextStyle(
                    color: mostUsedColor,
                  ),
                ),
                hint: '09-09-1987',
              ),
              const SizedBox(height: 15),
              DefaultFormField(
                controller: _companyBankAccount,
                validate: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Password Can\'t be Empty';
                  }
                },
                type: TextInputType.number,
                label: Text(
                  'Bank Account',
                  style: TextStyle(
                    color: mostUsedColor,
                  ),
                ),
                hint: '4996-9887-1125-1234',
              ),
              const SizedBox(height: 15),
              DefaultFormField(
                controller: _companyMainCurrency,
                validate: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Password Can\'t be Empty';
                  }
                },
                type: TextInputType.text,
                label: Text(
                  'Main Currency',
                  style: TextStyle(
                    color: mostUsedColor,
                  ),
                ),
                hint: 'USD',
              ),
              const SizedBox(height: 15),
              DefaultFormField(
                controller: _companyPersonalId,
                validate: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Password Can\'t be Empty';
                  }
                },
                type: TextInputType.text,
                label: Text(
                  'Personal Id',
                  style: TextStyle(
                    color: mostUsedColor,
                  ),
                ),
                hint: 'joo',
              ),
              const SizedBox(height: 15),
              DefaultFormField(
                controller: _companyIbanNumber,
                validate: (value) {
                  if (value.isEmpty || value == null) {
                    return 'Password Can\'t be Empty';
                  }
                },
                type: TextInputType.number,
                label: Text(
                  'Iban Number',
                  style: TextStyle(
                    color: mostUsedColor,
                  ),
                ),
                hint: '123456789987654321',
              ),
              const SizedBox(height: 20),
              DefaultElevatedButton(
                pressed: () {},
                text: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

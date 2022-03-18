import 'package:flutter/material.dart';
import 'package:payment_methode/presentation/shared/local/constance.dart';

class TermsAndCondiotion extends StatelessWidget {
  const TermsAndCondiotion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mostUsedColor),
        title: Text(
          'Terms And Policies',
          style: TextStyle(
            color: mostUsedColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              'The application provides the service of paying electricity, water, gas, landline and charging bills for mobile phones at any time and anywhere through the application within the Arab Republic of Egypt.  S-PAY provides easy, simple and secure payment services 24 hours a day.',
              style: TextStyle(
                color: mostUsedColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '* Transferring money to the account is done every week on the company’s account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '* The company must send their Apis to the s-pay account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '* The company must write the commercial register and its tax card',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '* The company can know its bills by entering the application by obtaining the user name and password after S-pay send their After 48hr',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '* The company must commit to me a fixed 2% rate on each payment',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

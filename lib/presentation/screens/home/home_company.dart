import 'package:flutter/material.dart';
import 'package:payment_methode/presentation/shared/local/constance.dart';
import 'package:payment_methode/presentation/widget/Buttons/elvated_button.dart';

class CompanyHome extends StatelessWidget {
  const CompanyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Text(
                  'payWme',
                  style: TextStyle(
                    color: mostUsedColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DancingScript',
                  ),
                ),
                const Spacer(),
                const Image(
                  image: AssetImage('assets/images/home/homecompany.png'),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              'No Reciets Yet',
              style: TextStyle(
                color: mostUsedColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            DefaultElevatedButton(
              pressed: () {},
              text: 'LogOut',
            ),
          ],
        ),
      ),
    );
  }
}

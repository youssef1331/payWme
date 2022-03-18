import 'package:flutter/material.dart';
import 'package:payment_methode/presentation/shared/local/constance.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mostUsedColor),
        centerTitle: true,
        title: Text(
          'About Us',
          style: TextStyle(
            color: mostUsedColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const SizedBox(
              width: double.infinity,
              height: 200,
              child: Image(
                image: AssetImage('assets/images/home/aboutus.jpg'),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'An e-payment system is a way of making transactions or paying for goods and services through an electronic medium, without the use of checks or cash. It’s also called an electronic payment system or online payment system. Read on to learn more.',
              style: TextStyle(
                letterSpacing: 1,
                wordSpacing: 1,
                color: mostUsedColor,
                fontSize: 18,
              ),
            ),
            Text(
              'The electronic payment system has grown increasingly over the last decades due to the growing spread of internet-based banking and shopping. As the world advances more with technology development, we can see the rise of electronic payment systems and payment processing devices. As these increase, improve, and provide ever more',
              style: TextStyle(
                letterSpacing: 1,
                wordSpacing: 1,
                color: mostUsedColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

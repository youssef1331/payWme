import 'package:flutter/material.dart';
import 'package:payment_methode/presentation/shared/local/constance.dart';

class Recites extends StatelessWidget {
  const Recites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'History',
          style: TextStyle(
            color: mostUsedColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'No Recits Yet',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Neonderthaw',
          ),
        ),
      ),
    );
  }
}

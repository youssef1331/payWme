import 'package:flutter/material.dart';
import 'package:payment_methode/data/onboardingmodel/on_boarding_model.dart';

Widget buildOnBoardingItem(OnBooardinModel model) {
  return Column(
    children: [
      Image(
        image: AssetImage(model.image),
      ),
      const SizedBox(height: 30.0),
      Text(
        model.body,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 30.0),
      Text(
        model.title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
        ),
      ),
    ],
  );
}

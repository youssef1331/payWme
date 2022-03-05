import 'package:flutter/material.dart';

navigateAndFinsh(context, Widget screen) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

navigatTo(context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}

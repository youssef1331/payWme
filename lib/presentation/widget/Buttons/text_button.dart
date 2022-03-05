import 'package:flutter/material.dart';

class CustomeTButton extends StatelessWidget {
  final dynamic pressed;
  final String text;
  const CustomeTButton({
    Key? key,
    required this.pressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: pressed,
      child: Text(text),
    );
  }
}

Widget defaultTextButton(
  Function pressed,
  String text,
) =>
    TextButton(
      onPressed: () {
        pressed;
      },
      child: Text(text),
    );

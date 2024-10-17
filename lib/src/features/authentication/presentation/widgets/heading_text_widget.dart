import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String textMessage;
  const HeadingText({required this.textMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textMessage,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }
}

import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double? height;
  const SecondaryButton(
      {required this.onPressed,
      required this.buttonText,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 65),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
      ),
    );
  }
}

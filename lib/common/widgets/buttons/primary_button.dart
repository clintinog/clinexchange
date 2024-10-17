import 'package:clinexchange/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final double? height;
  const PrimaryButton({
    required this.onPressed,
    required this.buttonText,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height ?? 65)),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: const TextStyle(
          color: AppColor.lightBackgroundColor,
        ),
      ),
    );
  }
}

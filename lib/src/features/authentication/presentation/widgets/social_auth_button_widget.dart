import 'package:clinexchange/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialAuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  const SocialAuthButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style:ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColor.whiteColor,
          foregroundColor: textColor ?? AppColor.whiteColor,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
          ),
          padding: EdgeInsets.symmetric(vertical: 12.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, height: 34.h, width: 24.w,),
            SizedBox(width: 10.w,),
            Text(text, style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ));
  }
}

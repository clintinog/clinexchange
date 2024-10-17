import 'package:clinexchange/common/widgets/buttons/primary_button.dart';
import 'package:clinexchange/core/assets/app_images.dart';
import 'package:clinexchange/core/theme/app_color.dart';
import 'package:clinexchange/src/features/authentication/presentation/pages/login.dart';
import 'package:clinexchange/src/features/authentication/presentation/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});
  static const name = 'get-started';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100.h),

              // Replace with Logo Here
              Text(
                'ClinExchange',
                style: TextStyle(
                  fontSize: 28.sp,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(
                height: 40.h,
              ),
              Image.asset(
                AppImages.welcomeImage,
                height: 250.h,
              ),
              SizedBox(
                height: 50.h,
              ),

              // Welcome text
              Text(
                'Welcome to ClinExchange',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.darkGreyColor),
              ),

              SizedBox(
                height: 10.h,
              ),

              // Description text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Text(
                  'Start your journey toward smarter group saving, loans, and financial collaboration.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColor.darkGreyColor,
                  ),
                ),
              ),
              const Spacer(),
              // Adding the Signup button
              PrimaryButton(
                  onPressed: () {
                    context.pushNamed(SignUpPage.name);
                    // context.push(SignUpPage.name);
                  },
                  buttonText: 'Signup'),
              SizedBox(
                height: 10.sp,
              ),
              // Adding the "Already have an account? Login" text with a button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColor.darkGreyColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.goNamed(LoginPage.name);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

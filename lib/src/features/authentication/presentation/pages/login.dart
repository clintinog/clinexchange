import 'package:clinexchange/common/widgets/buttons/primary_button.dart';
import 'package:clinexchange/core/assets/app_images.dart';
import 'package:clinexchange/src/features/authentication/presentation/pages/signup.dart';
import 'package:clinexchange/src/features/authentication/presentation/widgets/heading_text_widget.dart';
import 'package:clinexchange/src/features/authentication/presentation/widgets/social_auth_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinexchange/core/theme/app_color.dart';
import 'package:clinexchange/common/widgets/input_fields/primary_input_widget.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  static const name = "login";
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ClinExchange',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              const HeadingText(textMessage: 'Welcome'),
              SizedBox(height: 20.h),
              Image.asset(
                AppImages.loginImage,
                height: 200.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 80.h),
              PrimaryInputTextFormField(
                controller: _phoneController,
                labelText: 'Phone Number',
                prefixIcon: Icons.phone,
                isPhoneField: true,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20.h),
              
              PrimaryButton(onPressed: (){}, buttonText: 'Login'),
              SizedBox(height: 20.h),
               Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Or login with',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: SocialAuthButton(onPressed: () {  }, icon: AppImages.googleIcon, text: 'Google',),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: SocialAuthButton(onPressed: () {  }, icon: AppImages.facebookIcon, text: 'Facebook',),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        context.pushNamed(SignUpPage.name);
                      },
                      child: const Text('Sign up'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

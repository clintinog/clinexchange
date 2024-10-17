import 'dart:io';

import 'package:clinexchange/common/widgets/buttons/primary_button.dart';
import 'package:clinexchange/common/widgets/input_fields/primary_input_widget.dart';
import 'package:clinexchange/core/assets/app_images.dart';
import 'package:clinexchange/src/features/authentication/presentation/bloc/signup/signup_bloc.dart';
import 'package:clinexchange/src/features/authentication/presentation/bloc/signup/signup_events.dart';
import 'package:clinexchange/src/features/authentication/presentation/bloc/signup/signup_states.dart';
import 'package:clinexchange/src/features/authentication/presentation/pages/login.dart';
import 'package:clinexchange/src/features/authentication/presentation/widgets/heading_text_widget.dart';
import 'package:clinexchange/src/features/authentication/presentation/widgets/social_auth_button_widget.dart';
import 'package:clinexchange/src/features/authentication/presentation/widgets/terms_and_conditions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';



class SignUpPage extends StatefulWidget {
  static const String name = "signup";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignUpBloc>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Sign up successful!')),
              );
              // Navigate to the next screen or perform any other action
            } else if (state is SignUpFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Center(
                    child: Image.asset(
                      AppImages.registrationImage,
                      height: 150.h,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  const HeadingText(textMessage: 'Register'),
                  SizedBox(height: 40.h),
                  PrimaryInputTextFormField(
                    controller: bloc.firstNameController,
                    labelText: 'First Name',
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(height: 16.h),
                  PrimaryInputTextFormField(
                    controller: bloc.lastNameController,
                    labelText: 'Last Name',
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(height: 16.h),
                  PrimaryInputTextFormField(
                    controller: bloc.phoneNumberController,
                    labelText: 'Phone Number',
                    isPhoneField: true,
                    prefixIcon: Icons.phone,
                  ),
                  SizedBox(height: 16.h),
                  PrimaryInputTextFormField(
                    controller: bloc.emailController,
                    labelText: 'Email (optional)',
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(height: 16.h),
                  TermsAndConditionsCheckbox(
                    isChecked: _isTermsAccepted,
                    onChanged: (value) {
                      setState(() {
                        _isTermsAccepted = value ?? false;
                      });
                    },
                    onTermsTap: () {
                      // Navigate to terms and conditions page
                    },
                  ),
                  SizedBox(height: 16.h),
                  PrimaryButton(
                    onPressed: state is SignUpLoading || !_isTermsAccepted
                        ? null
                        : () {
                            context.read<SignUpBloc>().add(SignUpSubmittedEvent());
                          },
                    buttonText: state is SignUpLoading ? 'Loading...' : 'Create Account',
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          'Or continue with',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  SocialAuthButton(
                    onPressed: () {
                      // Implement Google sign-up
                    },
                    icon: AppImages.googleIcon,
                    text: 'Continue with Google',
                  ),
                  SizedBox(height: 16.h),
                  SocialAuthButton(
                    onPressed: () {
                      // Implement Facebook sign-up
                    },
                    icon: AppImages.facebookIcon,
                    text: 'Continue with Facebook',
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          context.goNamed(LoginPage.name);
                        },
                        child: const Text('Login'),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

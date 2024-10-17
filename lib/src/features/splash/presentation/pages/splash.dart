import 'package:clinexchange/core/assets/app_vectors.dart';
import 'package:clinexchange/src/features/introduction/presentation/pages/get_started_page.dart';
import 'package:clinexchange/src/features/introduction/presentation/pages/onboarding_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
  static const name = 'splash';
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    redirect(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppVectors.logo,
          width: 300,
          height: 300,
        ),
      ),
    );
  }

  Future<void> redirect(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    // Navigate to the get started page using go router.
    // ignore: use_build_context_synchronously
    context.goNamed(GetStartedScreen.name);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const name = 'get-started';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children: [
        Container(),
        Container(),
        Container(),
        Container(),
        Container(),
      ],),
    );
  }
}

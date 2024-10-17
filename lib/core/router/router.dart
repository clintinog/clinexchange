import 'package:clinexchange/src/features/authentication/presentation/pages/login.dart';
import 'package:clinexchange/src/features/authentication/presentation/pages/signup.dart';
import 'package:clinexchange/src/features/introduction/presentation/pages/onboarding_screens.dart';
import 'package:clinexchange/src/features/introduction/presentation/pages/get_started_page.dart';
import 'package:clinexchange/src/features/splash/presentation/pages/splash.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  routes: [
    // Routes for the splash screen
    GoRoute(
      path: '/',
      name: SplashPage.name,
      builder: (context, state) {
        return const SplashPage();
      },
    ),

    // Routes for the get started screen
    GoRoute(
      path: '/get-started',
      name: GetStartedScreen.name,
      builder: (context, state) {
        return const GetStartedScreen();
      },
    ),

    // Route for Signup page
    GoRoute(
      path: '/signup',
      name: SignUpPage.name,
      builder: (context, state) {
        return SignUpPage();
      },
    ),

    // Route for Login page
    GoRoute(
      path: '/login',
      name: LoginPage.name,
      builder: (context, state) {
        return LoginPage();
      },
    )
  ],
);

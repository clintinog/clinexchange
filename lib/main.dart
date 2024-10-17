import 'package:clinexchange/firebase_options.dart';
import 'package:clinexchange/service_locator.dart' as di; // for dependency injection
import 'package:clinexchange/src/features/authentication/presentation/bloc/signup/signup_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'core/theme/app_theme.dart';
import 'package:clinexchange/core/router/router.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(const ClinExchange());
}

class ClinExchange extends StatelessWidget {
  const ClinExchange({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(275, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => GetIt.I<SignUpBloc>()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            routerConfig: goRouter,
          ),
        );
      },
    );
  }
}

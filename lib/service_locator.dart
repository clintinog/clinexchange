import 'package:clinexchange/src/features/authentication/data/data_sources/auth_service.dart';
import 'package:clinexchange/src/features/authentication/data/repositories_imp/auth_rep_impl.dart';
import 'package:clinexchange/src/features/authentication/domain/repositories/auth_repo.dart';
import 'package:clinexchange/src/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:clinexchange/src/features/authentication/presentation/bloc/signup/signup_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Services
  getIt.registerSingleton<AuthService>(AuthServiceImpl(
    baseUrl: 'https://your-api-endpoint.com',
  ));

  // Repositories
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  // Usecases
  getIt.registerSingleton<SignUpUseCase>(SignUpUseCase());

  // BLoCs
  getIt.registerFactory(() => SignUpBloc(signUpUseCase: getIt()));
}

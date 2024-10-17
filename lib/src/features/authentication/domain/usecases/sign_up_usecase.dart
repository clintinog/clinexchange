import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:clinexchange/core/errors/failures.dart';
import 'package:clinexchange/core/usecase/usecase.dart';
import 'package:clinexchange/src/features/authentication/domain/entities/user.dart';
import 'package:clinexchange/src/features/authentication/domain/repositories/auth_repo.dart';

class SignUpUseCase implements UseCase<UserEntity, SignUpParams> {
  final AuthRepository _repository;

  SignUpUseCase({AuthRepository? repository}) 
      : _repository = repository ?? GetIt.I<AuthRepository>();

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params) async {
    return await _repository.signUp(
      firstName: params.firstName,
      lastName: params.lastName,
      phoneNumber: params.phoneNumber,
      email: params.email,
    );
  }
}

class SignUpParams {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? email;

  SignUpParams({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    this.email,
  });
}

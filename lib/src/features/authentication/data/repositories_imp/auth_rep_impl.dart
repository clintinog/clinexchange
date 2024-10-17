import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:clinexchange/core/errors/failures.dart';
import 'package:clinexchange/src/features/authentication/data/data_sources/auth_service.dart';
import 'package:clinexchange/src/features/authentication/domain/entities/user.dart';
import 'package:clinexchange/src/features/authentication/domain/repositories/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl({AuthService? authService})
      : _authService = authService ?? GetIt.I<AuthService>();

  @override
  Future<Either<Failure, String>> initiatePhoneVerification(String phoneNumber) async {
    try {
      final result = await _authService.initiatePhoneVerification(phoneNumber);
      return Right(result);
    } catch (e) {
      return Left(PhoneVerificationFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> verifyOTP(String verificationId, String otp) async {
    try {
      final result = await _authService.verifyOTP(verificationId, otp);
      return Right(result);
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    String? email,
  }) async {
    try {
      final user = await _authService.signUp(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
      );
      return Right(user);
    } catch (e) {
      return Left(SignUpFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(String phoneNumber) async {
    try {
      final user = await _authService.signIn(phoneNumber);
      return Right(user);
    } catch (e) {
      return Left(SignInFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await _authService.signOut();
      return const Right(unit);
    } catch (e) {
      return Left(SignOutFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final user = await _authService.getCurrentUser();
      return Right(user);
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUserProfile({
    required String userId,
    String? firstName,
    String? lastName,
    String? email,
    String? profilePictureUrl,
  }) async {
    try {
      final user = await _authService.updateUserProfile(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        profilePictureUrl: profilePictureUrl,
      );
      return Right(user);
    } catch (e) {
      return Left(ProfileUpdateFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(String userId, String filePath) async {
    try {
      final url = await _authService.uploadProfilePicture(userId, filePath);
      return Right(url);
    } catch (e) {
      return Left(FileUploadFailure(e.toString()));
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    return _authService.isAuthenticated();
  }
}

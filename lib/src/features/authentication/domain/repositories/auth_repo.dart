import 'package:clinexchange/core/errors/failures.dart';
import 'package:clinexchange/src/features/authentication/domain/entities/user.dart';
import 'package:dartz/dartz.dart';


abstract class AuthRepository {
  /// Initiates the phone verification process
  /// Returns a verification ID on success or a Failure on error
  Future<Either<Failure, String>> initiatePhoneVerification(String phoneNumber);

  /// Verifies the OTP (One-Time Password) sent to the user's phone
  /// Returns a success message on valid OTP or a Failure on error
  Future<Either<Failure, String>> verifyOTP(String verificationId, String otp);

  /// Signs up a new user with the provided information
  /// Returns the created UserEntity on success or a Failure on error
  Future<Either<Failure, UserEntity>> signUp({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    String? email,
  });

  /// Signs in an existing user using their phone number
  /// Returns the UserEntity on successful sign-in or a Failure on error
  Future<Either<Failure, UserEntity>> signIn(String phoneNumber);

  /// Signs out the current user
  /// Returns Unit on successful sign-out or a Failure on error
  Future<Either<Failure, Unit>> signOut();

  /// Retrieves the currently authenticated user
  /// Returns the UserEntity if a user is authenticated, null if not, or a Failure on error
  Future<Either<Failure, UserEntity?>> getCurrentUser();

  /// Updates the user's profile information
  /// Returns the updated UserEntity on success or a Failure on error
  Future<Either<Failure, UserEntity>> updateUserProfile({
    required String userId,
    String? firstName,
    String? lastName,
    String? email,
    String? profilePictureUrl,
  });

  /// Uploads a profile picture for the user
  /// Returns the URL of the uploaded picture on success or a Failure on error
  Future<Either<Failure, String>> uploadProfilePicture(String userId, String filePath);

  /// Checks if a user is currently authenticated
  /// Returns true if authenticated, false otherwise
  Future<bool> isAuthenticated();
}

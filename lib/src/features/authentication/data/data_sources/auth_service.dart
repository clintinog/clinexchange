import 'package:clinexchange/src/features/authentication/data/models/user_model.dart';
import 'package:clinexchange/src/features/authentication/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';

abstract class AuthService {
  Future<String> initiatePhoneVerification(String phoneNumber);
  Future<String> verifyOTP(String verificationId, String otp);
  Future<UserEntity> signUp({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    String? email,
  });
  Future<UserEntity> signIn(String phoneNumber);
  Future<void> signOut();
  Future<UserEntity?> getCurrentUser();
  Future<UserEntity> updateUserProfile({
    required String userId,
    String? firstName,
    String? lastName,
    String? email,
    String? profilePictureUrl,
  });
  Future<String> uploadProfilePicture(String userId, String filePath);
  Future<bool> isAuthenticated();
}

class AuthServiceImpl implements AuthService {
  final FirebaseAuth _firebaseAuth;
  final Dio _dio;

  AuthServiceImpl({
    FirebaseAuth? firebaseAuth,
    Dio? dio,
    required String baseUrl,
  }) : 
    _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
    _dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl));

  /// Initiates the phone verification process using Firebase Authentication.
  ///
  /// [phoneNumber] The phone number to verify, in international format (e.g., +1234567890).
  ///
  /// Returns a [Future] that completes with the verification ID when the SMS is sent.
  /// This verification ID is needed for the subsequent OTP verification step.
  ///
  /// Throws an [Exception] if the phone verification process fails.
  @override
  Future<String> initiatePhoneVerification(String phoneNumber) async {
    String verificationId = '';
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (_) {},
      verificationFailed: (e) => throw Exception(e.message),
      codeSent: (String verId, _) => verificationId = verId,
      codeAutoRetrievalTimeout: (_) {},
    );
    return verificationId;
  }

  /// Verifies the OTP (One-Time Password) sent to the user's phone.
  ///
  /// [verificationId] The verification ID received from [initiatePhoneVerification].
  /// [otp] The one-time password received by the user.
  ///
  /// Returns a [Future] that completes with a success message when the OTP is verified.
  ///
  /// Throws an [Exception] if the OTP verification fails.
  @override
  Future<String> verifyOTP(String verificationId, String otp) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    await _firebaseAuth.signInWithCredential(credential);
    return 'OTP Verified Successfully';
  }

  /// Signs up a new user with the provided information.
  ///
  /// [firstName] The user's first name.
  /// [lastName] The user's last name.
  /// [phoneNumber] The user's phone number.
  /// [email] The user's email address (optional).
  ///
  /// Returns a [Future] that completes with a [UserModel] representing the newly created user.
  ///
  /// Throws an [Exception] if the sign-up process fails.
  @override
  Future<UserModel> signUp({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    String? email,
  }) async {
    try {
      final response = await _dio.post(
        '/users',
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'phoneNumber': phoneNumber,
          'email': email,
        },
      );

      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to create user: ${e.message}');
    }
  }

  /// Signs in an existing user using their phone number.
  ///
  /// [phoneNumber] The phone number of the user trying to sign in.
  ///
  /// Returns a [Future] that completes with a [UserModel] representing the signed-in user.
  ///
  /// Throws an [Exception] if the sign-in process fails.
  @override
  Future<UserModel> signIn(String phoneNumber) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {'phoneNumber': phoneNumber},
      );

      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to sign in: ${e.message}');
    }
  }

  /// Signs out the current user.
  ///
  /// This method signs out the user from Firebase Authentication.
  /// You might want to extend this method to also make an API call to invalidate the session on the server.
  ///
  /// Throws an [Exception] if the sign-out process fails.
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    // You might want to make an API call here to invalidate the session on the server
  }

  /// Retrieves the currently authenticated user.
  ///
  /// Returns a [Future] that completes with a [UserModel] representing the current user,
  /// or null if no user is currently authenticated.
  ///
  /// Throws an [Exception] if the process of fetching the current user fails.
  @override
  Future<UserModel?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;

    try {
      final response = await _dio.get('/users/${user.uid}');
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to get current user: ${e.message}');
    }
  }

  /// Updates the user's profile information.
  ///
  /// [userId] The ID of the user whose profile is being updated.
  /// [firstName] The new first name (optional).
  /// [lastName] The new last name (optional).
  /// [email] The new email address (optional).
  /// [profilePictureUrl] The new profile picture URL (optional).
  ///
  /// Returns a [Future] that completes with a [UserModel] representing the updated user profile.
  ///
  /// Throws an [Exception] if the profile update process fails.
  @override
  Future<UserModel> updateUserProfile({
    required String userId,
    String? firstName,
    String? lastName,
    String? email,
    String? profilePictureUrl,
  }) async {
    try {
      final response = await _dio.put(
        '/users/$userId',
        data: {
          if (firstName != null) 'firstName': firstName,
          if (lastName != null) 'lastName': lastName,
          if (email != null) 'email': email,
          if (profilePictureUrl != null) 'profilePictureUrl': profilePictureUrl,
        },
      );

      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to update user profile: ${e.message}');
    }
  }

  /// Uploads a profile picture for the user.
  ///
  /// [userId] The ID of the user whose profile picture is being uploaded.
  /// [filePath] The local path to the image file to be uploaded.
  ///
  /// Returns a [Future] that completes with the URL of the uploaded profile picture.
  ///
  /// Throws an [Exception] if the upload process fails.
  @override
  Future<String> uploadProfilePicture(String userId, String filePath) async {
    try {
      final formData = FormData.fromMap({
        'picture': await MultipartFile.fromFile(filePath),
      });

      final response = await _dio.post(
        '/users/$userId/profile-picture',
        data: formData,
      );

      return response.data['url'];
    } on DioException catch (e) {
      throw Exception('Failed to upload profile picture: ${e.message}');
    }
  }

  /// Checks if a user is currently authenticated.
  ///
  /// Returns a [Future] that completes with a boolean value:
  /// true if a user is authenticated, false otherwise.
  @override
  Future<bool> isAuthenticated() async {
    return _firebaseAuth.currentUser != null;
  }
}

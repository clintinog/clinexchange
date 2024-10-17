import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure([this.message = '']);

  @override
  List<Object> get props => [message];
}

// Authentication related failures
class AuthenticationFailure extends Failure {
  const AuthenticationFailure([super.message = 'Authentication failed']);
}

class PhoneVerificationFailure extends Failure {
  const PhoneVerificationFailure([super.message = 'Phone verification failed']);
}

class SignUpFailure extends Failure {
  const SignUpFailure([super.message = 'Sign up failed']);
}

class SignInFailure extends Failure {
  const SignInFailure([super.message = 'Sign in failed']);
}

class SignOutFailure extends Failure {
  const SignOutFailure([super.message = 'Sign out failed']);
}

// Network related failures
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network error occurred']);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error occurred']);
}

// Data related failures
class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache error occurred']);
}

class DataParsingFailure extends Failure {
  const DataParsingFailure([super.message = 'Data parsing error occurred']);
}

// User related failures
class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure([super.message = 'User not found']);
}

class ProfileUpdateFailure extends Failure {
  const ProfileUpdateFailure([super.message = 'Profile update failed']);
}

// File related failures
class FileUploadFailure extends Failure {
  const FileUploadFailure([super.message = 'File upload failed']);
}

// Permission related failures
class PermissionDeniedFailure extends Failure {
  const PermissionDeniedFailure([super.message = 'Permission denied']);
}

// Unexpected failures
class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'An unexpected error occurred']);
}


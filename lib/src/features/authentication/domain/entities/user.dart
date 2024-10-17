import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? email;
  final String? profilePictureUrl;
  final DateTime createdAt;
  final DateTime? lastLoginAt;

  const UserEntity({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    this.email,
    this.profilePictureUrl,
    required this.createdAt,
    this.lastLoginAt,
  });

  String get fullName => '$firstName $lastName';

  @override
  List<Object?> get props => [
        userId,
        firstName,
        lastName,
        phoneNumber,
        email,
        profilePictureUrl,
        createdAt,
        lastLoginAt,
      ];

  UserEntity copyWith({
    String? userId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? profilePictureUrl,
    DateTime? createdAt,
    DateTime? lastLoginAt,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
    );
  }
}

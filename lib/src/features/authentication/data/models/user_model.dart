import 'package:clinexchange/src/features/authentication/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String userId,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    String? email,
    String? profilePictureUrl,
    required DateTime createdAt,
    DateTime? lastLoginAt,
  }) : super(
          userId: userId,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          email: email,
          profilePictureUrl: profilePictureUrl,
          createdAt: createdAt,
          lastLoginAt: lastLoginAt,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      profilePictureUrl: json['profilePictureUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      lastLoginAt: json['lastLoginAt'] != null ? DateTime.parse(json['lastLoginAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'createdAt': createdAt.toIso8601String(),
      'lastLoginAt': lastLoginAt?.toIso8601String(),
    };
  }

  UserModel copyWith({
    String? userId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? profilePictureUrl,
    DateTime? createdAt,
    DateTime? lastLoginAt,
  }) {
    return UserModel(
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

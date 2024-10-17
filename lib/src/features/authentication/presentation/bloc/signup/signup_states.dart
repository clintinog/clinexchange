import 'package:clinexchange/src/features/authentication/domain/entities/user.dart';
import 'package:equatable/equatable.dart';


abstract class SignUpState extends Equatable {
  const SignUpState();
  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserEntity user;

  const SignUpSuccess({required this.user});
}

class SignUpFailure extends SignUpState {
  final String message;

  const SignUpFailure({required this.message});
  @override
  List<Object?> get props => [message];
}

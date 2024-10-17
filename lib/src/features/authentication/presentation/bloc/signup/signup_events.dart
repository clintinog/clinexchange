import 'package:equatable/equatable.dart';


abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
  @override
  List<Object?> get props => [];
}

class SignUpSubmittedEvent extends SignUpEvent {}

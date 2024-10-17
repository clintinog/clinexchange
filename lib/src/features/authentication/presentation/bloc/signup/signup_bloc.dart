import 'package:clinexchange/src/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:clinexchange/src/features/authentication/presentation/bloc/signup/signup_events.dart';
import 'package:clinexchange/src/features/authentication/presentation/bloc/signup/signup_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';



class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;
  
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  SignUpBloc({SignUpUseCase? signUpUseCase})
      : _signUpUseCase = signUpUseCase ?? GetIt.I<SignUpUseCase>(),
        super(SignUpInitial()) {
    on<SignUpSubmittedEvent>(_onSignUpSubmitted);
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmittedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());
    final result = await _signUpUseCase(SignUpParams(firstName: firstNameController.text, lastName: lastNameController.text, phoneNumber: phoneNumberController.text, email: emailController.text));

    result.fold(
      (failure) => emit(SignUpFailure(message: failure.message)),
      (user) => emit(SignUpSuccess(user: user)),
    );
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    return super.close();
  }
}

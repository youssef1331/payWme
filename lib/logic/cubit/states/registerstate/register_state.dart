abstract class RegisterStates {}

class IntialRegisterState extends RegisterStates {}

class RegisterChangePasswordVisibiltyState extends RegisterStates {}

class RegisterLaodingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

class RegisterCreateUserSucessfuly extends RegisterStates {}

class RegisterErrorInCreateUser extends RegisterStates {
  final String error;
  RegisterErrorInCreateUser(this.error);
}

class RegisterVerifyPhoneSucess extends RegisterStates {}

class RegisterVerifyPhoneError extends RegisterStates {
  final String error;
  RegisterVerifyPhoneError(this.error);
}

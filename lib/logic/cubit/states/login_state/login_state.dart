abstract class LogINStates {}

class IntialLogInState extends LogINStates {}

class LoginToEmailLoadingstate extends LogINStates {}

class LoginToEmailSucsessstate extends LogINStates {
  final String uId;
  LoginToEmailSucsessstate(this.uId);
}

class LoginToEmailErrorstate extends LogINStates {
  final String error;
  LoginToEmailErrorstate(this.error);
}

class LoginChangePasswordVisibilatystate extends LogINStates {}

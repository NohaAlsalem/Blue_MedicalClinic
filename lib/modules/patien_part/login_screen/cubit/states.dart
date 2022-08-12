abstract class PatientLoginStates{}

class PatientLoginInitState extends PatientLoginStates{}

class PatientLoginLoadingState extends PatientLoginStates{}

class PatientLoginSuccessState extends PatientLoginStates{}

class PatientLoginErrorState extends PatientLoginStates{
  final String error;
  PatientLoginErrorState(this.error);
}

class PatientLoginChangePasswordVisibility extends PatientLoginStates{}
class CreateTokenSuccess extends PatientLoginStates{}
class CreateTokenError extends PatientLoginStates{}


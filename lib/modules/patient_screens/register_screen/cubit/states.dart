abstract class PatientRegisterStates{}

// screen states
class PatientRegisterInitState extends PatientRegisterStates{}
class PatientRegisterLoadingState extends PatientRegisterStates{}
class PatientRegisterSuccessState extends PatientRegisterStates{}
class PatientRegisterErrorState extends PatientRegisterStates{
  final String error;
  PatientRegisterErrorState(this.error);
}
class PatientRegisterChangePasswordVisibility extends PatientRegisterStates{}
// create patient states
class CreatePatientSuccessState extends PatientRegisterStates{}
class CreatePatientErrorState extends PatientRegisterStates{
  final String error;
  CreatePatientErrorState(this.error);
}
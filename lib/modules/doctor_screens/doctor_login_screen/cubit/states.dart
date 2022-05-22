abstract class DoctorLoginStates{}

class DoctorLoginInitState                extends DoctorLoginStates{}
// screen states
class DoctorLoginLoadingState             extends DoctorLoginStates{}
class DoctorLoginSuccessState             extends DoctorLoginStates{}
class DoctorLoginErrorState               extends DoctorLoginStates {
  String? error;
  DoctorLoginErrorState({this.error});
}
class DoctorLoginChangePasswordVisibility extends DoctorLoginStates{}
// authentication states
class DoctorLoginAuthSuccessState             extends DoctorLoginStates{}
class DoctorLoginAuthErrorState               extends DoctorLoginStates {
  String? error;
  DoctorLoginAuthErrorState({this.error});
}
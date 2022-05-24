abstract class HrLoginStates{}

class HrLoginInitStates extends HrLoginStates{}

class HrLoginSuccessStates extends HrLoginStates{}

class HrLoginErrorStates extends HrLoginStates{
  String? error;
  HrLoginErrorStates(this.error);
}

class HrLoginLoadingStates extends HrLoginStates{}

class HrLoginPasswordVisibility extends HrLoginStates{}


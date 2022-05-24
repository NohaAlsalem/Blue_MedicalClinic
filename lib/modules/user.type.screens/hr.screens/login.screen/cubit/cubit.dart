import 'package:blue_medical_clinic/modules/user.type.screens/hr.screens/login.screen/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HrLoginCubit extends Cubit<HrLoginStates>   {
  HrLoginCubit() : super(HrLoginInitStates());
  static HrLoginCubit get(context) => BlocProvider.of(context);
  bool showPassword = true;
  IconData? suffixIcon = Icons.visibility;
  void changePasswordVisibility() {
    showPassword = !showPassword;
    suffixIcon = showPassword ? Icons.visibility : Icons.visibility_off;
    emit(HrLoginPasswordVisibility());
  }

  void hrLogin({
    @required String? email,
    @required String? password,
  }) {
    emit(HrLoginLoadingStates());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      print('Hr Login Success , Hr email is : ${value.user!.email}');
      emit(HrLoginSuccessStates());
    }).catchError((error) {
      print('error is Hr Login : ${error.toString()}');
      emit(HrLoginErrorStates(error));
    });
  }
}

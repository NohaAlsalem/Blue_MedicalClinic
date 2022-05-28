import 'package:bloc/bloc.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/doctor_screens/doctor_login_screen/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginDoctorCubit extends Cubit<DoctorLoginStates> {
  LoginDoctorCubit() : super(DoctorLoginInitState());
  static LoginDoctorCubit get(context) => BlocProvider.of(context);
  bool showPassword = true;
  IconData? suffixIcon = Icons.visibility;
  void changePasswordVisibility() {
    showPassword = !showPassword;
    suffixIcon = showPassword ? Icons.visibility : Icons.visibility_off;
    emit(DoctorLoginChangePasswordVisibility());
  }

  void doctorLogin({
    @required String? email,
    @required String? password,
  }) {
    emit(DoctorLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      emit(DoctorLoginAuthSuccessState());
    }).catchError((error) {
      emit(DoctorLoginAuthErrorState(error));
    });
  }
}

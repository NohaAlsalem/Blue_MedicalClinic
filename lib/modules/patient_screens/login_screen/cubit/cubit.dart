import 'package:bloc/bloc.dart';
import 'package:blue_medical_clinic/modules/doctor_screens/doctor_login_screen/cubit/states.dart';
import 'package:blue_medical_clinic/modules/patient_screens/login_screen/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPatientCubit extends Cubit<PatientLoginStates> {
  LoginPatientCubit() : super(PatientLoginInitState());

  static LoginPatientCubit get(context) => BlocProvider.of(context);

  bool showPassword = true;

  IconData? suffixIcon = Icons.visibility;

  void changePasswordVisibility() {
    showPassword = !showPassword;
    suffixIcon = showPassword ? Icons.visibility : Icons.visibility_off;
    emit(PatientLoginChangePasswordVisibility());
  }

  void patientLogin(
  {
    @required String? email,
    @required String? password,
}
      )
  {
    emit(PatientLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!).then((value)
    {
      print('Login Success , patient email  is : ${value.user!.email}');
      emit(PatientLoginSuccessState());
    }).catchError((error)
    {
      print('Login Failed , error is : ${error.toString()}');
      emit(PatientLoginErrorState(error.toString()));
    });
  }
}

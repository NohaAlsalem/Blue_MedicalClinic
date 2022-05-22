import 'package:bloc/bloc.dart';
import 'package:blue_medical_clinic/modules/doctor_screens/doctor_login_screen/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginDoctorCubit extends Cubit<DoctorLoginStates>{
  LoginDoctorCubit() : super(DoctorLoginInitState());
  static LoginDoctorCubit get(context)=> BlocProvider.of(context);
  bool showPassword = true;
  IconData? suffixIcon = Icons.visibility;
  void changePasswordVisibility(){
    showPassword = !showPassword;
    suffixIcon = showPassword ? Icons.visibility : Icons.visibility_off;
    emit(DoctorLoginChangePasswordVisibility());
  }
  void doctorLogin(){}
}
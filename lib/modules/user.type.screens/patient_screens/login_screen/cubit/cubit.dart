import 'package:bloc/bloc.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/login_screen/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
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


 String ?sfcmToken;
  //var fcmToken;
  var fcmToken = FirebaseMessaging.instance.getToken();
  void patientLogin({
    required String? email,
    required String? password,
    required String? FcmToken,
  }) {
    emit(PatientLoginLoadingState());
    FirebaseFirestore.instance.collection('fcm_token').doc(FcmToken);
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      print('Login Success , patient email  is : ${value.user!.email}');
      print('fcm: $fcmToken');
      sfcmToken=FcmToken;
      emit(PatientLoginSuccessState());
    }).catchError((error) {
      print('Login Failed , error is : ${error.toString()}');
      emit(PatientLoginErrorState(error.toString()));
    });
  }
   var preff;
   getslectedpref()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
     preff=pref.getString('token');
      emit(getslectedpreff());
  }

}

import 'package:blue_medical_clinic/models/fcm_token_model/fcm_token_model.dart';
import 'package:blue_medical_clinic/modules/patien_part/login_screen/cubit/states.dart';
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

  var fcmToken = FirebaseMessaging.instance.getToken();
  void patientLogin({
    required String? email,
    required String? password,
    required String? fcmToken,
  }) {
    emit(PatientLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      print('Login Success , patient email  is : ${value.user!.email}');
      emit(PatientLoginSuccessState());
      createPatientToken(fcmToken: fcmToken);
    }).catchError((error) {
      print('Login Failed , error is : ${error.toString()}');
      emit(PatientLoginErrorState(error.toString()));
    });
  }

  void createPatientToken({
    required String? fcmToken,
  }) {
    FcmTokenModel fcmTokenModel = FcmTokenModel(
      fcmToken: fcmToken,
    );
    FirebaseFirestore.instance
        .collection('Fcm Token')
        .doc('usersToken')
        .collection('patient')
        .doc(fcmToken)
        .set(fcmTokenModel.toMap())
        .then((token) {
      print('CREATE TOKEN COLLECTION *SUCCESS*');
      emit(CreateTokenSuccess());
    }).catchError((error) {
      print('CREATE TOKEN COLLECTION *ERROR* , ERROR IS : ${error.toString()}');
      emit(CreateTokenError());
    });
  }
}

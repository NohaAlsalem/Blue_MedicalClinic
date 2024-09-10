import 'package:blue_medical_clinic/models/fcm_token_model/fcm_token_model.dart';
import 'package:blue_medical_clinic/modules/patien_part/login_screen/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

  var fcmToken = FirebaseMessaging.instance.getToken();
  void patientLogin({
    required String? email,
    required String? password,
    // required String? fcmToken,
  }) {
    emit(PatientLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      print('Login Success , patient email  is : ${value.user!.email}');
      emit(PatientLoginSuccessState());
    }).catchError((error) {
      print('Login Failed , error is : ${error.toString()}');
      emit(PatientLoginErrorState(error.toString()));
    });
  }

  void createPatientToken({
    required String? email,
    required String? fcmToken,
  }) {
    FcmTokenModel fcmTokenModel = FcmTokenModel(
      fcmToken: fcmToken,
      email: email,
    );
    FirebaseFirestore.instance
        .collection('Fcm Token')
        .doc('usersToken')
        .collection('patients')
        .doc(fcmToken)
        .set(fcmTokenModel.toMap())
        .then((token) {
      print('CREATE FCM TOKEN COLLECTION *SUCCESS*');
      emit(CreateTokenSuccess());
    }).catchError((error) {
      print('CREATE TOKEN COLLECTION *ERROR* , ERROR IS : ${error.toString()}');
      emit(CreateTokenError());
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:blue_medical_clinic/models/patient_models/patient.register.model/patient.user.model.dart';
import 'package:blue_medical_clinic/modules/patient_screens/register_screen/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPatientCubit extends Cubit<PatientRegisterStates> {
  RegisterPatientCubit() : super(PatientRegisterInitState());

  static RegisterPatientCubit get(context) => BlocProvider.of(context);
  bool showPassword = true;
  IconData? suffixIcon = Icons.visibility;
  bool showConfirmPassword = true;
  IconData? suffixConfirmIcon = Icons.visibility;
  void changePasswordVisibility() {
    showPassword = !showPassword;
    suffixIcon = showPassword ? Icons.visibility : Icons.visibility_off;
    emit(PatientRegisterChangePasswordVisibility());
  }

  void changePasswordConfirmVisibility() {
    showConfirmPassword = !showConfirmPassword;
    suffixConfirmIcon =
        showConfirmPassword ? Icons.visibility : Icons.visibility_off;
    emit(PatientRegisterChangePasswordVisibility());
  }

  void createPatient(
      {
     @required String? userId,
     @required String? email,
     @required String? name,
     @required String? phone})
     {
    PatientRegisterModel patientRegisterModel = PatientRegisterModel(
      userId: userId,
      email: email,
      name: name,
      phone: phone,
    );
    FirebaseFirestore.instance
        .collection('patients Accounts')
        .doc(userId)
        .set(patientRegisterModel.toMap())
        .then((value) {
      print('Create patient Done');
      emit(CreatePatientSuccessState());
    }).catchError((error) {
      print('Error in create patient , error is : ${error.toString()}');
      emit(CreatePatientErrorState(error.toString()));
    });
  }

  void patientRegister({
    @required String? name,
    @required String? email,
    @required String? phone,
    @required String? password,
  }) {
    emit(PatientRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      print('email : ${value.user!.email}');
      print('name : ${value.user!.displayName}');
      print('phone number : ${value.user!.phoneNumber}');
      createPatient(
          userId: value.user!.uid,
          email: value.user!.email,
          name: value.user!.displayName,
          phone: value.user!.phoneNumber);
      //emit(PatientRegisterSuccessState());
    }).catchError((error) {
      print('Error in register user : ${error.toString()}');
      emit(PatientRegisterErrorState(error.toString()));
    });
  }
}

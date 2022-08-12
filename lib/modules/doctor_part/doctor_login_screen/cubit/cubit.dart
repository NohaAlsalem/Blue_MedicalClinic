import 'package:bloc/bloc.dart';
import 'package:blue_medical_clinic/modules/doctor_part/doctor_login_screen/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  List doctor =[];

 CollectionReference docRefGastroenterology = FirebaseFirestore.instance.collection('Section').doc('Doctors').collection('Gastroenterology ');
  //nameDoctor(){
    // CollectionReference docRefGastroenterology = FirebaseFirestore.instance.collection('Section').doc('Doctors').collection('Gastroenterology ');
    // var names=await docRefGastroenterology.get();
    // List<QueryDocumentSnapshot> listDoc=names.docs;
    // return listDoc.forEach((element){
    //   element.data()['name'];
    //});
  myWidget(context ,i) => FutureBuilder(
          future: docRefGastroenterology.get(),
          builder: ( BuildContext context, AsyncSnapshot snapshot)
          {
            if (snapshot.hasError) print(snapshot.error);
            if (snapshot.hasData)  {
            }
            return snapshot.data.docs[i].data()['Name'];
          });
    }

//import 'package:bloc/bloc.dart';
import 'dart:io';
import 'package:blue_medical_clinic/modules/reports/write_report/cubit/satats.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


class PatientReport extends Cubit<Statestoreport>{

  PatientReport():super (IneitialState());

  static PatientReport get(Context)=>BlocProvider.of(Context);

  String dropdownvalue='public state';
  var items=['public state','rediographic image','prescription',];
  change(newValue){
  dropdownvalue=newValue;
  emit(dropdownState());
  }


  File? imageFile ;

  void imageFromGallery(BuildContext context) async{
    var image=await ImagePicker().pickImage(source:ImageSource.gallery);
    imageFile=image as File;
    emit(choosimageState());
  }

  void imageFromCamera(BuildContext context) async{
    var imagec=await ImagePicker().pickImage(source:ImageSource.camera);
      imageFile=imagec as File;
      emit(choosimageState());
  }
}
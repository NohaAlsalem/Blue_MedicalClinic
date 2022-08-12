import 'package:bloc/bloc.dart';
import 'package:blue_medical_clinic/modules/doctor_part/home_layout/home_screen.dart';
import 'package:blue_medical_clinic/modules/patien_part/home_Layout/Sections.dart';
import 'package:blue_medical_clinic/modules/patien_part/home_Layout/cubit/states.dart';
import 'package:blue_medical_clinic/modules/patien_part/home_Layout/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientHomeCubit extends Cubit<PatientHomeStates>{
  PatientHomeCubit() : super(PatientHomeInit());
  static PatientHomeCubit get(context) => BlocProvider.of(context);
  final List<String> _sectionList =
  [
    'assets/blue_logo.jpg',
    'assets/blue_logo.jpg',
    'assets/blue_logo.jpg',
    'assets/blue_logo.jpg',
    'assets/blue_logo.jpg',
    'assets/blue_logo.jpg',
  ];
  List<BottomNavigationBarItem>bottmsItem=[
    BottomNavigationBarItem(
      icon:Icon(Icons.six_ft_apart,),
      label:'Section',
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.settings,),
      label:'Setting',
    ),

  ];
  int currentScreen=0;
  List<Widget> screen=[
    //DoctorHome(),
    setting(),
  ];
  // List<String> mytitle=[
  //   'MyProduce',
  //   'SaleNow',
  //   'MySales',
  //   'Residual'
  // ];
  void changeNav(index){
    currentScreen=index;
    emit(chaneNavigation());
  }
}
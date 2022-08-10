import 'package:bloc/bloc.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/home_screen/home_screen/cubit/states.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/home_screen/home_screen/home_screen.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/home_screen/home_screen/setting.dart';
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
    PatientHomeScreen(),
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
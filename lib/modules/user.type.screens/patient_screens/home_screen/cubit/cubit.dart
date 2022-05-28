import 'package:bloc/bloc.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/home_screen/cubit/states.dart';
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
}
import 'package:bloc/bloc.dart';
import 'package:blue_medical_clinic/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);

}
import 'package:blue_medical_clinic/modules/splash_screen/splash_screen.dart';
import 'package:blue_medical_clinic/layout/home_layout.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/login_screen/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/register_screen/cubit/cubit.dart';
import 'package:blue_medical_clinic/shared/cubit/cubit.dart';
import 'package:blue_medical_clinic/shared/cubit/states.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget
{
   const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
        => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AppCubit(),),
            BlocProvider(create: (context) => LoginPatientCubit(),),
            BlocProvider(create: (context) => RegisterPatientCubit(),),
          ],
          child: BlocProvider(
            create: (BuildContext context) => AppCubit(),
            child: BlocConsumer<AppCubit, AppStates>(
              listener: (BuildContext context, state) {  },
              builder: (BuildContext context, Object? state) {

                return  MaterialApp(
                  theme: ThemeData( bottomNavigationBarTheme:BottomNavigationBarThemeData(
                    type:BottomNavigationBarType.fixed,
                    selectedItemColor: Color(0xFF0876D4),
                    backgroundColor:  Color(0xAAf3e5f5),
                    elevation:20.0,
                  ),
                  ),
                debugShowCheckedModeBanner: false,
                home:SplashScreen(),
                  routes: {
                    //'writeReport': (context) => writeReport(),
                    //'dp': (context) => details_patient(),
                    //'report':(context)=>my_reports(),
                   // 'times':(context)=>page_times(),
                    //'times':(context)=>times(),
                  },
              );
                },
            ),
          ),
        );
}


import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/cubit/state.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/dental.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/gastroenterology.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/heart.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/neurological.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/psychological.dart';
import 'package:blue_medical_clinic/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientHomeScreen extends StatelessWidget {
   const PatientHomeScreen({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
     List<String> _sectionList =
     [
       'assets/gastroenterology.jpg',
       'assets/neurological.jpg',
       'assets/psychological.png',
       'assets/dental.jpg',
       'assets/heart.jpg',
       'assets/corona.jpg',
     ];
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, TimeStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
          body: Center(
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff93f0fc),
                    Color(0xAAf3e5f5),
                  ]),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height : 20),
                    const Text('Sections', style: TextStyle(
                        fontSize: 30,
                        color : Color(0xFF0876D4),
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic
                    ),
                    ),
                    const SizedBox(height : 30),
                    Expanded(
                         child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      padding: const EdgeInsets.all(5),
                      children: _sectionList.map((item) => Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: GestureDetector(
                          onTap: (){
                            if(_sectionList.indexOf(item)==0)
                              {
                                navigateTo( GastroenterologySection(), context);
                              }
                            if(_sectionList.indexOf(item)==1)
                             {
                               navigateTo( NeurologicalSection(), context);
                             }
                            if(_sectionList.indexOf(item)==2)
                            {
                              navigateTo( PsychologicalSection(), context);
                            }
                            if(_sectionList.indexOf(item)==3)
                            {
                              navigateTo( DentalSection(), context);
                            }
                            if(_sectionList.indexOf(item)==4)
                            {
                              navigateTo( HeartSection(), context);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(image: AssetImage(item),
                                  fit: BoxFit.cover
                              ),
                            ),
                          ),
                        ),
                      )).toList(),)

                    ),
                ],
              ),
            ),
          ),
          ),
        ); },
      ),
    );
  }
  // Widget sectionBuild() =>  GridView.count(
  //   crossAxisCount: 2,
  //   mainAxisSpacing: 20,
  //   crossAxisSpacing: 20,
  //   padding: const EdgeInsets.all(5),
  //   children: _sectionList.map((item) => Card(
  //     color: Colors.transparent,
  //     elevation: 0,
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20.0),
  //         image: DecorationImage(image: AssetImage(item),
  //             fit: BoxFit.cover
  //         ),
  //       ),
  //     ),
  //   )).toList(),);
}


import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/doctor.list.screen.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/home_screen/cubit/cubit.dart';
import 'package:blue_medical_clinic/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/states.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     List<String> _sectionList =
    [
      'assets/corona.jpg',
      'assets/heart.jpg',
      'assets/dental.jpg',
      'assets/eye.jpg',
      'assets/child.jpg',
      'assets/orthopedic.jpg'
    ];
    return BlocProvider(
      create: (BuildContext context) => PatientHomeCubit(),
      child: BlocConsumer<PatientHomeCubit, PatientHomeStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
          body: SafeArea(
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
                  // Container(
                  //   width: double.infinity,
                  //   height: 150,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20.0),
                  //     image: const DecorationImage(image: AssetImage('assets/pageView2.jpg'),
                  //         fit : BoxFit.contain
                  //     ),
                  //   ),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20.0),
                  //       gradient: LinearGradient(
                  //         begin: Alignment.bottomRight,
                  //         colors:[
                  //           Colors.black.withOpacity(.7),
                  //           Colors.black.withOpacity(.1),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height : 10),
                  const Text('Sections', style: TextStyle(
                      fontSize: 30,
                      color : Color(0xFF0876D4),
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic
                  ),
                  ),
                  const SizedBox(height : 20),
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
                              navigateTo(const DoctorsList(), context);
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

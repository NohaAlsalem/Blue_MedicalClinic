import 'package:blue_medical_clinic/modules/doctor_part/reports/reports.dart';
import 'package:blue_medical_clinic/modules/doctor_part/reports/time_doctor.dart';
import 'package:blue_medical_clinic/modules/doctor_part/reports/write_report/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/doctor_part/reports/write_report/cubit/satats.dart';
import 'package:blue_medical_clinic/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorHome extends StatelessWidget {
  List dataTime =[];

  DoctorHome(data){
    this.dataTime= data;
  }


  text(String d,String t) {
    return Row(
      children: [
        Text(
          '$d :',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        Text(
          ' $t',
          style: const TextStyle(
            //fontWeight: FontWeight.bold,
            fontSize: 20.0,
            //
            color: Color(0xAA420168),
          ),
        ),
      ],
    );
  }
  space(h,w){
    return SizedBox(height:h,width: w,);
  }
  String dropDownValue = 'Public State';
  var items = ['Public State', 'Radiographic image', 'Prescription',];
  DateTime? selectedTime;
  var formKey = GlobalKey<FormState>();
  var report = TextEditingController();
  var diagnosis = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PatientReport()..info,
      child: BlocConsumer<PatientReport, StatestoReport>(
          listener: (context, state) {},
          builder:  (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xAAf3e5f5),
                        Color(0xAA93f0fc),
                        Color(0xAAd1c4e9),
                        Color(0xAAf3e5f5),
                      ],
                    ),
                  ),
                  child: Column(
                      children:  [
                        Stack(
                          children: [
                            Container(
                              height: 215.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.elliptical(
                                      MediaQuery.of(context).size.width,115.0
                                  ),
                                ),
                                color: Colors.indigo,
                              ),
                            ),
                            Container(
                              height: 200.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.elliptical(
                                      MediaQuery.of(context).size.width,100.0
                                  ),
                                ),
                                image:const DecorationImage(
                                  image:AssetImage('assets/images/homeDoctor.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children:  [
                              const CircleAvatar(
                                radius: 60.0,
                                backgroundColor: Colors.indigo,
                                child: CircleAvatar(
                                  radius: 55.0,
                                  backgroundImage: AssetImage('assets/images/doctor.jpg'),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${dataTime.last['doctorSelected']}',
                                style:const TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 30,
                                ),
                              ),
                              const Text(
                                'Medical Clinic',
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const  SizedBox(
                          height: 60,
                        ),
                        Material(
                          shadowColor: const Color(0xFF326fa5),
                          elevation: 20,
                          borderRadius: BorderRadius.circular(30.0),
                          child: InkWell(
                            onTap: (){
                              print(PatientReport.get(context).info);
                              navigateTo(Times(dataTime), context);
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity ,
                              padding: const EdgeInsets.all(19.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Color(0xAAf3e5f5),
                                    Color(0xAAEBE6EC),
                                    Color(0xAA9696C8),
                                  ],
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Times',
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0,
                                    //fontFamily: 'The Life-Serif',
                                  ),),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Material(
                          shadowColor: const Color(0xFF326fa5),
                          elevation: 20,
                          borderRadius: BorderRadius.circular(30.0),
                          child: InkWell(
                            onTap: (){
                              navigateTo(ReportDoctor(dataTime ), context);
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity ,
                              padding: const EdgeInsets.all(19.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Color(0xAAf3e5f5),
                                    Color(0xAAEBE6EC),
                                    Color(0xAA9696C8),
                                  ],
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Reports',
                                  style: TextStyle(
                                    // color: Colors.indigo,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0,
                                    fontFamily: 'The Life-Serif',
                                  ),),
                              ),
                            ),
                          ),
                        )
                      ]
                  ),
                ),
              ),
            );
          }),
    );
  }

}


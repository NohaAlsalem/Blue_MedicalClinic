import 'package:blue_medical_clinic/modules/doctor_part/reports/write_report/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/doctor_part/reports/write_report/cubit/satats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Report extends StatelessWidget{

  String? imagePath;
  String dropDownValue = 'Public State';
  var items = ['Public State', 'Radiographic image', 'Prescription',];
  DateTime? selectedTime;
  var formKey = GlobalKey<FormState>();
  var report = TextEditingController();
  var diagnosis = TextEditingController();
  String? doctorSelected;



  //var doctor;

  Report({Key? key}) : super(key: key);

  text(String d,String t) {
    return Row(
      children: [
        Text(
          '$d :',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            //color: Color(0xAA420168),
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PatientReport(),
      child: BlocConsumer<PatientReport, StatestoReport>(
          listener: (context, state) {},
          builder:  (context, state) {
            return Scaffold(
              body: Center(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topCenter,
                        colors: [
                          Color(0xAA1a76b5),
                          Color(0xAAf3e5f5),
                        ]),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            doctorN('Dr..Musallam AL-Kayal');
                            PatientReport.get(context).getDataMusallam(context);
                          },
                          child: Container(
                            color: Colors.white,
                            child: const Text('Doctor musallam'),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextButton(
                          onPressed: () {
                            doctorN('Dr.Ahmad AL-jarrah');
                            PatientReport.get(context).getDataAhmad(context);
                          },
                          child: Container(
                            color: Colors.white,
                            child: const Text('Doctor Ahmad'),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextButton(
                          onPressed: () {
                            doctorN('Dr.Amal AL-Masry');
                            PatientReport.get(context).getDataAmal(context);
                          },
                          child: Container(
                            color: Colors.white,
                            child: const Text('Dr.Amal AL-Masry'),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextButton(
                          onPressed: () {
                            doctorN('Dr.Hassan AL-Maleh');
                            PatientReport.get(context).getDataHassan(context);
                          },
                          child: Container(
                            color: Colors.white,
                            child: const Text('Doctor hasan'),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextButton(
                          onPressed: () {
                            doctorN('Dr.Fahad AL-Ebrahem');
                            PatientReport.get(context).getDataFahad(context);
                          },
                          child: Container(
                            color: Colors.white,
                            child: const Text('Doctor Fahad'),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextButton(
                          onPressed: () {
                            doctorN('Dr.Ali Ahmad');
                            PatientReport.get(context).getDataAli(context);
                          },
                          child: Container(
                            color: Colors.white,
                            child: const Text('Doctor Ali'),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextButton(
                          onPressed: () {
                            doctorN('Dr. Nedal Hussain');
                            PatientReport.get(context).getDataNedal(context);
                          },
                          child: Container(
                            color: Colors.white,
                            child: const Text('Doctor Nedal'),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextButton(
                          onPressed: () {
                            doctorN('Dr.Mohammad Kasem');
                            PatientReport.get(context).getDataMKassem(context);
                          },
                          child: Container(
                            color: Colors.white,
                            child: const Text('Dr.Mohammad Kasem'),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextButton(
                          onPressed: () {
                            doctorN('Dr.Mohammad Saeed');
                            PatientReport.get(context).getDataMSaeed(context);
                          },
                          child: Container(
                            color: Colors.white,
                            child: const Text('Doctor MSaeed'),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextButton(
                          onPressed: () {
                            doctorN('Dr.Naser Mohammad.');
                            PatientReport.get(context).getDataNaser(context);
                          },
                          child: Container(
                            color: Colors.white,
                            child: const Text('Doctor Naser'),
                          ),
                        )
                      ],
                    ),
                  ),),),
            );
          }),
    );
  }
  void doctorN(currentDoctorName)
  {
    doctorSelected = currentDoctorName;
  }

  List image =[];
}


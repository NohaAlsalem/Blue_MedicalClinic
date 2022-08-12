
import 'package:blue_medical_clinic/modules/doctor_part/reports/write_report/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/doctor_part/reports/write_report/cubit/satats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Times extends StatelessWidget{

  List dataTime =[];
  Times(data){
    this.dataTime= data;
  }
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context) => PatientReport(),
        child: BlocConsumer<PatientReport, StatestoReport>(
            listener: (context, state) {},
            builder:  (context, state) {
              return
                Scaffold(
                  body: Container(
                    decoration:const BoxDecoration(
                      color: Colors.white,
                      gradient:  LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xAA93f0fc),
                          Color(0xAAf3e5f5),
                          Color(0xAA93f0fc),
                          Color(0xAAd1c4e9),
                          Color(0xAAf3e5f5),
                        ],
                      ),
                    ),
                    child:Column(
                      children: [
                        Expanded(flex:1,
                          child: Container(
                            width:double.infinity,
                            decoration:const BoxDecoration(
                              color: Color(0xFF326fa5),
                              borderRadius:BorderRadius.only(bottomLeft:Radius.circular(40.0),bottomRight:Radius.circular(40.0)),
                            ),
                            clipBehavior:Clip.antiAliasWithSaveLayer,
                            child:const Card(
                                shadowColor:Color(0xAA420168),
                                elevation: 20,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color:Color(0xAA93f0fc),
                                shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                                ),
                                child:Image(image:AssetImage('assets/homeDoctor.jpg'),
                                  fit: BoxFit.cover,)
                            ),
                          ),
                        ),
                        const SizedBox(height:20.0),
                        Expanded(
                          flex:3,
                          child:
                          ListView.builder(
                            itemBuilder:(context,i) => timeAppointment(context , i ,dataTime) ,
                            itemCount: dataTime.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
            }
        ));
  }

  Widget timeAppointment (context ,i ,  List list ) => InkWell(
    onTap:(){
    },
    child: Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 20.0, end: 20.0, top: 0.0, bottom: 20.0),
      child: Material(
        shadowColor: const Color(0xFF326fa5),
        elevation: 20,
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          height: 60.0,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xAAf3e5f5),
                Color(0xAA9696C8),
              ],
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFF326fa5),
                  radius: 30.0,
                  child: Text(
                      '${dataTime[i]['hour']} : ${dataTime[i]['minute']}',
                      style: const TextStyle(color: Color(0xAAf3e5f5),)),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${dataTime[i]['name']}', style: const TextStyle(
                        color: Color(0xAA420168),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                      const SizedBox(height: 5.0),
                      Text('${dataTime[i]['date']}', style:const  TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
              ]
          ),
        ),
      ),
    ),
  );

}

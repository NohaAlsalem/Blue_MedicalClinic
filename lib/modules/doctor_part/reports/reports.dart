import 'package:blue_medical_clinic/models/list_reports/list_report.dart';
import 'package:blue_medical_clinic/modules/doctor_part/reports/paitent_reports.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../models/list_reports/list_report.dart';


class my_reports extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(

          decoration:BoxDecoration(
            color: Colors.white,
        gradient: const LinearGradient(
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
            decoration:BoxDecoration(
              color: Color(0xFF326fa5),
                borderRadius:BorderRadius.only(bottomLeft:Radius.circular(40.0),bottomRight:Radius.circular(40.0)),
            ),
              clipBehavior:Clip.antiAliasWithSaveLayer,
              child:Card(
                shadowColor:const Color(0xAA420168),
                elevation: 20,

                clipBehavior: Clip.antiAliasWithSaveLayer,
                color:Color(0xAA93f0fc),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),

                  ),
                  //child:Lottie.asset('assets/lottie/clinical.json') ,
                  //child: Image(image:AssetImage('asset/images/TOP.jpg'),fit:BoxFit.cover,)
                 ),
              ),
          ),
              SizedBox(height:20.0),
              Expanded(
                flex:3,
                child:ListView.separated(
                  itemBuilder:(context,index)
                  {
                    return report(
                      id: areports[index].id,
                      name: areports[index].name,
                      date: areports[index].date,
                      time: areports[index].time,
                      paitent_report: areports[index].paitent_report,
                      age: areports[index].age,
                      gender: areports[index].gender,
                      bloodtype: areports[index].bloodtype,
                    );},
                  separatorBuilder: (context,index)=>SizedBox(),
                  itemCount: areports.length,
                ),
              ),

        ],
      ),
       ),

    );

  }
}

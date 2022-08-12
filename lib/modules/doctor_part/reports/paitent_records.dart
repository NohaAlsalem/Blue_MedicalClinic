import 'package:blue_medical_clinic/modules/doctor_part/reports/write_report/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/doctor_part/reports/write_report/cubit/satats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class PatientRecord extends StatelessWidget{
  text(String d,String t) {
    return Row(
      children: [
        Text(
          '$d :',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            //color: Color(0xAA420168),
          ),
        ),
        Text(
          ' $t',
          style: const TextStyle(
            //fontWeight: FontWeight.bold,
            fontSize: 17.0,
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

  List data = [];
  PatientRecord(dataa){
    this.data=dataa;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => PatientReport()..reports,
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
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex:1,
                                child: Container(
                                  width:double.infinity,
                                  decoration:const BoxDecoration(
                                    color: Color(0xFF326fa5),
                                    borderRadius:BorderRadius.only(bottomLeft:Radius.circular(40.0),bottomRight:Radius.circular(40.0)),
                                  ),
                                  clipBehavior:Clip.antiAliasWithSaveLayer,
                                  child:Card(
                                    shadowColor:const Color(0xAA420168),
                                    elevation: 20,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color:const Color(0xAA93f0fc),
                                    shape:const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                                    ),
                                    child:Lottie.asset('assets/clinical.json') ,
                                  ),
                                ),
                              ),
                              const SizedBox(height:20.0),
                              Expanded(
                                flex:3,
                                child:
                                ListView.builder(
                                  itemBuilder:(context,i) => record(context , i ,data ) ,
                                  itemCount: data.length,
                                ),
                              ),
                            ]
                        ))),
              );
            }));
  }

  Widget record (context , i , List list)=> InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (BuildContext context) => PatientReport()..reports,
              child: BlocConsumer<PatientReport, StatestoReport>(
                  listener: (context, state) {},
                  builder:  (context, state) {
                    return Scaffold(
                      body: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
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
                        child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      color: Color(0xAAd1c4e9),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40))),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.only(
                                            top: 10.0,
                                            start: 15.0,
                                            end: 15.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Center(
                                                child: Container(
                                                  height: 40.0,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: const Color(0xFF326fa5),
                                                      borderRadius: BorderRadius.circular(20.0)),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Center(
                                                      child: Text('${list[i]['name']}',
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 17.0,
                                                            fontWeight: FontWeight.bold),),
                                                    ),
                                                  ),
                                                ),),
                                              space(20.0,0.0),
                                              Row(
                                                children: [
                                                  text('age ' , '${list[i]['age']}' ),
                                                ],),
                                              space(8.0,0.0),
                                              Row(
                                                children: [
                                                  text(
                                                      'gender', '${list[i]['gender']}'),
                                                ],),
                                              space(8.0,0.0),
                                              Row(
                                                children: [
                                                  text(
                                                    'last visiting time', '${list[i]['hour']} : ${list[i]['minute']}',)
                                                ],),
                                              space(8.0,0.0),
                                              Row(children: [
                                                text('date of last visit','${list[i]['date']}'),
                                              ],),
                                              space(8.0,0.0),
                                              Row(
                                                children: const[
                                                  Text('Chronic Diseases :' , style:  TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                  ),),
                                                ],
                                              ),
                                              space(8.0,0.0),
                                              Row(
                                                children: [
                                                  Text('${list[i]['disease']}' , style: const TextStyle(
                                                    //fontWeight: FontWeight.bold,
                                                    fontSize: 17.0,
                                                    //
                                                    color: Color(0xAA420168),
                                                  ),),
                                                ],
                                              ),
                                              Row(
                                                children: const [
                                                  Text(
                                                    'Medical Condition :',style:  TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                    //color: Color(0xAA420168),
                                                  ), ),
                                                ],),
                                              space(8.0,0.0),
                                              Row(
                                                children: [
                                                  Text('${list[i]['diagnosis']}' , style: const TextStyle(
                                                    fontSize: 17.0,
                                                    //
                                                    color: Color(0xAA420168),
                                                  ), )
                                                ],
                                              ),
                                              space(8.0,0.0),
                                              Row(
                                                children: const [
                                                  Text(
                                                    'Description :',style:  TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                    //color: Color(0xAA420168),
                                                  ), ),
                                                ],),
                                              space(8.0,0.0),
                                              Row(children: [
                                                Text('${list[i]['report']}', style: const TextStyle(
                                                  fontSize: 20.0,
                                                  color: Color(0xAA420168),
                                                )),
                                              ],),
                                              space(8.0,0.0),
                                              SingleChildScrollView(
                                                scrollDirection: Axis.horizontal ,
                                                child: Row(
                                                  children: [
                                                    InkWell(
                                                      child:
                                                      Stack(
                                                          children:[
                                                            Column(
                                                              children: [
                                                                Container(
                                                                    width: 210,
                                                                    height: 210,
                                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                    decoration: const BoxDecoration(
                                                                        borderRadius:  BorderRadius.only(
                                                                            topLeft:Radius.circular(20),
                                                                            topRight: Radius.circular(20))
                                                                    ),
                                                                    child: Image(image:NetworkImage('${list[i]['imageReport']}',),fit: BoxFit.cover,)),
                                                                Container(
                                                                  width: 210,
                                                                  height: 30,
                                                                  //clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                  decoration:  const  BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                      bottomRight: Radius.circular(50),
                                                                      bottomLeft: Radius.circular(50),
                                                                    ),
                                                                    gradient: LinearGradient(
                                                                        begin: Alignment.topRight,
                                                                        end: Alignment.bottomRight,
                                                                        colors: [
                                                                          // Color(0xFF326fa5),
                                                                          // Color(0xff93f0fc),
                                                                          Color(0xAAf3e5f5),
                                                                          Color(0xFF326fa5),
                                                                          Color(0xFF326fa5),
                                                                          Color(0xFF326fa5),
                                                                        ]),
                                                                  ),
                                                                  child:const Center(child:
                                                                  Text('Reports',
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontWeight: FontWeight.w600,
                                                                        fontSize: 17
                                                                    ),)),
                                                                  // Card(
                                                                  //     shadowColor:const Color(0xAA93f0fc),
                                                                  //     elevation: 20,
                                                                  //     clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                  //     color: const Color(0xAAd1c4e9),
                                                                  //     shape: RoundedRectangleBorder(
                                                                  //       borderRadius: BorderRadius.circular(20),
                                                                  //     ),
                                                                  //     child: Text('Report')),
                                                                ),
                                                              ],
                                                            )

                                                          ]

                                                      ),
                                                      onTap: (){
                                                        showDialog(context: context,
                                                            builder:(BuildContext ctx){
                                                              return Padding(
                                                                  padding: const EdgeInsets.all(20.0),
                                                                  child: Container(
                                                                    //width: 210,
                                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                      decoration:BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(40)),
                                                                      child: Image(image:NetworkImage('${list[i]['imageReport']}',),fit: BoxFit.cover,))
                                                              );});
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    InkWell(
                                                      child:
                                                      Stack(
                                                          children:[
                                                            Column(
                                                              children: [
                                                                Container(
                                                                    width: 210,
                                                                    height: 210,
                                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                    decoration: const BoxDecoration(
                                                                        borderRadius:  BorderRadius.only(
                                                                            topLeft:Radius.circular(20),
                                                                            topRight: Radius.circular(20))
                                                                    ),
                                                                    child: Image(image:NetworkImage('${list[i]['imageRadiographic']}',),fit: BoxFit.cover,)),
                                                                Container(
                                                                  width: 210,
                                                                  height: 30,
                                                                  //clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                  decoration:  const  BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                      bottomRight: Radius.circular(50),
                                                                      bottomLeft: Radius.circular(50),
                                                                    ),
                                                                    gradient: LinearGradient(
                                                                        begin: Alignment.topRight,
                                                                        end: Alignment.bottomRight,
                                                                        colors: [
                                                                          // Color(0xFF326fa5),
                                                                          // Color(0xff93f0fc),
                                                                          Color(0xAAf3e5f5),
                                                                          Color(0xFF326fa5),
                                                                          Color(0xFF326fa5),
                                                                          Color(0xFF326fa5),
                                                                        ]),
                                                                  ),
                                                                  child:const Center(child:
                                                                  Text('Radiographic image',
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontWeight: FontWeight.w600,
                                                                        fontSize: 17
                                                                    ),)),
                                                                ),
                                                              ],
                                                            )

                                                          ]

                                                      ),
                                                      onTap: (){
                                                        showDialog(context: context,
                                                            builder:(BuildContext ctx){
                                                              return Padding(
                                                                  padding: const EdgeInsets.all(20.0),
                                                                  child: Container(
                                                                    //width: 210,
                                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                      decoration:BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(40)),
                                                                      child: Image(image:NetworkImage('${list[i]['imageRadiographic']}',),fit: BoxFit.cover,))
                                                              );});
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    InkWell(
                                                      child:
                                                      Stack(
                                                          children:[
                                                            Column(
                                                              children: [
                                                                Container(
                                                                    width: 210,
                                                                    height: 210,
                                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                    decoration: const BoxDecoration(
                                                                        borderRadius:  BorderRadius.only(
                                                                            topLeft:Radius.circular(20),
                                                                            topRight: Radius.circular(20))
                                                                    ),
                                                                    child: Image(image:NetworkImage('${list[i]['imageMedicalTests']}',),fit: BoxFit.cover,)),
                                                                Container(
                                                                  width: 210,
                                                                  height: 30,
                                                                  //clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                  decoration:  const  BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                      bottomRight: Radius.circular(50),
                                                                      bottomLeft: Radius.circular(50),
                                                                    ),
                                                                    gradient: LinearGradient(
                                                                        begin: Alignment.topRight,
                                                                        end: Alignment.bottomRight,
                                                                        colors: [
                                                                          Color(0xAAf3e5f5),
                                                                          Color(0xFF326fa5),
                                                                          Color(0xFF326fa5),
                                                                          Color(0xFF326fa5),
                                                                        ]),
                                                                  ),
                                                                  child:const Center(child:
                                                                  Text('Medical tests',
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontWeight: FontWeight.w600,
                                                                        fontSize: 17
                                                                    ),)),
                                                                ),
                                                              ],
                                                            )
                                                          ]
                                                      ),
                                                      onTap: (){
                                                        showDialog(context: context,
                                                            builder:(BuildContext ctx){
                                                              return Padding(
                                                                  padding: const EdgeInsets.all(20.0),
                                                                  child: Container(
                                                                    //width: 210,
                                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                      decoration:BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(40)),
                                                                      child: Image(image:NetworkImage('${list[i]['imageMedicalTests']}',),fit: BoxFit.cover,))
                                                              );});
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 15,),
                                              // Container(
                                              //   height: 90,
                                              //   width: 90,
                                              //   child:
                                              //   Image(image: AssetImage(list[i]['image'])),
                                              //Image(image: list[i]['report'] != null ? AssetImage(list[i]['image'])),

                                              //list[i]['report'] != null ? Image(image: AssetImage(list[i]['image']),);
                                              //list[i]['report'] != null ? Image.file(list[i]['report']! , width: 140, height: 140 , fit: BoxFit.cover,
                                              //image != null ? Image.file(image! , width: 140, height: 140 , fit: BoxFit.cover,,
                                              // )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    );
                  }
              ))));
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
                      '${data[i]['hour']} : ${data[i]['minute']}',
                      style: const TextStyle(color: Color(0xAAf3e5f5),)),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${data[i]['name']}', style: const TextStyle(
                        color: Color(0xAA420168),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                      const SizedBox(height: 5.0),
                      Text('${data[i]['date']}', style: const TextStyle(color: Colors.grey)),
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
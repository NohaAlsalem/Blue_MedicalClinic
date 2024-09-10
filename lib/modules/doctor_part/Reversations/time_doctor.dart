import 'package:blue_medical_clinic/modules/doctor_part/reports/write_report/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/doctor_part/reports/write_report/cubit/satats.dart';
import 'package:blue_medical_clinic/modules/patien_part/cubit/cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Times extends StatefulWidget {
  List dataTime = [];

  Times(data) {
    this.dataTime = data;
  }

  @override
  State<Times> createState() => _TimesState();
}

class _TimesState extends State<Times> {
  String? daySelected;

  void day(currentDay) {
    daySelected = currentDay;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => PatientReport(),
        ),
      ],
      child: BlocProvider(
          create: (BuildContext context) => PatientReport(),
          child: BlocConsumer<PatientReport, StatestoReport>(
              listener: (context, state) {},
              builder: (context, state) {
                return Scaffold(
                  body: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
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
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xFF326fa5),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0)),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: const Card(
                                shadowColor: Color(0xAA420168),
                                elevation: 20,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xAA93f0fc),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40)),
                                ),
                                child: Image(
                                  image: AssetImage('assets/homeDoctor.jpg'),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Expanded(
                          flex: 3,
                          child: ListView.builder(
                            itemBuilder: (context, i) =>
                                // Dismissible(
                                //     key:Key(i.toString()),
                                //     onDismissed: (direction) {
                                //       i.data.doc
                                //     },
                                timeAppointment(context, i, widget.dataTime),
                            itemCount: widget.dataTime.length,
                          ),
                          // ListView.builder(
                          //   itemBuilder:(context,i) => timeAppointment(context , i ,dataTime) ,
                          //   itemCount: dataTime.length,
                          //
                          // ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
    );
  }

  Widget timeAppointment(context, i, List list) => InkWell(
        onTap: () {},
        child: Dismissible(
          key: Key(i.toString()),
          onDismissed: (direction) {
            if(daySelected=='')
            FirebaseFirestore.instance.collection('appointment').doc('${widget.dataTime[i]['daySelected']}').collection('Reservations').doc('${widget.dataTime[i]['name']}').delete();
            // // await CounterCubit.get(context).deletData(list[i]);
            // if (daySelected.toString() == 'Monday') {
            //   await FirebaseFirestore.instance
            //       .collection('appointment')
            //       .doc('Monday')
            //       .collection('Reservations')
            //       .doc()
            //       .delete();
            //   print('ssssssss');
            // }
            // if (daySelected.toString() == 'Tuesday') {
            //   await FirebaseFirestore.instance
            //       .collection('appointment')
            //       .doc('Tuesday')
            //       .collection('Reservations')
            //       .doc()
            //       .delete();
            //   print('sss tue');؟
            // }
            // if (daySelected.toString() == 'Wednesday') {
            //   await FirebaseFirestore.instance
            //       .collection('appointment')
            //       .doc('Wednesday')
            //       .collection('Reservations')
            //       .doc()
            //       .delete();
            //   print('ssssssss');
            // }
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
                            '${widget.dataTime[i]['hour']} : ${widget.dataTime[i]['minute']}',
                            style: const TextStyle(
                              color: Color(0xAAf3e5f5),
                            )),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text('${widget.dataTime[i]['name']}',
                                    style: const TextStyle(
                                      color: Color(0xAA420168),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const SizedBox(height: 5.0),
                                Text('${widget.dataTime[i]['date']}',
                                    style: const TextStyle(color: Colors.grey)),
                                IconButton(onPressed: (){
                                  setState(() {
                                    FirebaseFirestore.instance.collection('appointment').doc('${widget.dataTime[i]['daySelected']}').collection('Reservations').doc('${widget.dataTime[i]['name']}').delete();
                                  });
                                }, icon: Icon(Icons.delete))
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0),
                    ]),
              ),
            ),
          ),
        ),
      );
}

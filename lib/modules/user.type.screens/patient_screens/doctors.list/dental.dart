import 'dart:core';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/booking.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/cubit/state.dart';
import 'package:blue_medical_clinic/shared/components/components.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';


class DentalSection extends StatelessWidget {

  List doctor =[];
  CollectionReference docRefDental  = FirebaseFirestore.instance.collection('Section').doc('Doctors').collection('dental');


  DateTime _dateTime = DateTime.now();



  DentalSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, TimeStates>(
          listener: (context, state) {},
          builder:  (context, state) {
            return Scaffold(
              body: Stack(
                children: [
                  Container(
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
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 180.0,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.indigo,
                                  Color(0xAA1a76b5),
                                  Color(0xFF9696C8),
                                ],
                              ),
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.elliptical(
                                    MediaQuery.of(context).size.width, 60.0 ),
                              ),
                            ),
                          ),
                          Container(
                            height: 180.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.elliptical(
                                    MediaQuery.of(context).size.width, 100.0 ),
                              ),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/booking.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0,),
                      Row(
                        children: const[
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 20.0,
                            ),
                            child: Text('Department Doctor', style: TextStyle(
                              fontSize: 23.0,
                              color:  Color(0xFF0876D4),
                              // color:  Color(0xFF326fa5),
                              // Color(0xFF01203b),
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Allison',
                            ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Material(
                            color: const Color(0xFFFAFAFF),
                            shadowColor: Colors.black,
                            elevation: 10,
                            borderRadius: BorderRadius.circular(30.0),
                            child: Container(
                              padding: const EdgeInsets.all(19.0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                ),
                              ),
                              child: FutureBuilder(
                                future: docRefDental.get(),
                                builder: ( BuildContext context, AsyncSnapshot snapshot)
                                {
                                  if (snapshot.hasError) print(snapshot.error);
                                  if (snapshot.hasData)  {
                                    return ListView.separated(
                                      itemCount: snapshot.data.docs.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) {
                                        return Material(
                                          color: Colors.white70,
                                          shadowColor:  Colors.black,
                                          elevation: 8,
                                          borderRadius: BorderRadius.circular(40.0),
                                          child: Container(
                                            padding: const EdgeInsets.all(19.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(40.0),
                                              gradient: const LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.topLeft,
                                                colors: [
                                                  Color(0xAA9696C8),
                                                  Color(0xAAEBE6EC),
                                                  Color(0xAAf3e5f5),
                                                ],
                                              ),
                                            ),
                                            child:  ListTile(
                                              leading:const Icon(Icons.person),
                                              title: Text('${snapshot.data.docs[i].data()['Name']}' ,
                                                style:  const TextStyle(
                                                    color:  Color(0xFF326fa5),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.0
                                                ),),
                                              dense: true,
                                              onTap: (){
                                                Navigator.push(
                                                  context, MaterialPageRoute(
                                                  builder: (context) =>
                                                      BlocProvider(
                                                        create: (BuildContext context) => CounterCubit(),
                                                        child: BlocConsumer<CounterCubit, TimeStates>(
                                                            listener: (context, state) {},
                                                            builder:  (context, state) {
                                                              return
                                                                Scaffold(
                                                                  body: Stack(
                                                                    children: [
                                                                      Container(
                                                                        decoration: const BoxDecoration(
                                                                          gradient: LinearGradient(
                                                                            begin: Alignment.topRight,
                                                                            end: Alignment.bottomRight,
                                                                            colors: [
                                                                              Color(0xAA93f0fc),
                                                                              Color(0xAAf3e5f5),
                                                                              Color(0xAAD5FCFF),
                                                                              Color(0xAAf3e5f5),
                                                                              Color(0xAAD5FCFF),
                                                                              Color(0xAAd1c4e9),
                                                                              Color(0xAAf3e5f5),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SingleChildScrollView(
                                                                        child: Column(
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                Container(
                                                                                  height: MediaQuery.of(context).size.height * 0.33,
                                                                                  decoration: const BoxDecoration(
                                                                                    gradient:  LinearGradient(
                                                                                      begin: Alignment.topRight,
                                                                                      end: Alignment.bottomLeft,
                                                                                      colors: [
                                                                                        Colors.indigo,
                                                                                        Color(0xAA1a76b5),
                                                                                        Color(0xFF9696C8),
                                                                                      ],
                                                                                    ),
                                                                                    // color: Color(0xFF326fa5),
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(60),
                                                                                      bottomRight: Radius.circular(50),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  height: MediaQuery.of(context).size.height * 0.31,
                                                                                  decoration: const BoxDecoration(
                                                                                    color: Colors.white,
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(60),
                                                                                      bottomRight: Radius.circular(50),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  height: MediaQuery.of(context).size.height * 0.29,
                                                                                  decoration: const BoxDecoration(
                                                                                    image: DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: AssetImage('assets/images/background.jpg'),
                                                                                    ),
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(60),
                                                                                      bottomRight: Radius.circular(50),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(left: 100, top: 120,),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.4,
                                                                                    height: MediaQuery.of(context).size.width * 0.4,
                                                                                    decoration: BoxDecoration(
                                                                                        border: Border.all(
                                                                                            color: const Color(0xFF326fa5),width: 5),
                                                                                        shape: BoxShape.circle,
                                                                                        color: Colors.white,
                                                                                        image: const DecorationImage(
                                                                                            fit: BoxFit.cover,
                                                                                            image: CachedNetworkImageProvider(
                                                                                                'https://i1.wp.com/allmedhealth.ca/wp-content/uploads/2021/01/cropped-Male_Doctor-1.png?fit=500%2C500&ssl=1&is-pending-load=1'))
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 5.0,
                                                                            ),
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Center(
                                                                                  child: Text(
                                                                                    '${snapshot.data.docs[i].data()['Name']}',
                                                                                    style: const TextStyle(
                                                                                      fontSize: 23.0,
                                                                                      color: Color(0xAA420168),
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontFamily: 'Monospace',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 8.0,
                                                                                ),
                                                                                Center(
                                                                                  child: Text(
                                                                                    '${snapshot.data.docs[i].data()['specialty']}',
                                                                                    style: const TextStyle(
                                                                                      fontSize: 15.0,
                                                                                      // color: Colors.indigo,
                                                                                      color: Color(0xAA420168),
                                                                                      //color: Color(0xFF01203b),
                                                                                      fontWeight: FontWeight.w800,
                                                                                      fontFamily: 'Monospace',
                                                                                      //  fontFamily: 'Allison',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 12.0,
                                                                                ),
                                                                                const Padding(
                                                                                  padding: EdgeInsets
                                                                                      .only(
                                                                                    left: 20.0,
                                                                                  ),
                                                                                  child: Text(
                                                                                    'About',
                                                                                    style: TextStyle(
                                                                                      color:  Color(0xFF0876D4),
                                                                                      fontSize: 20.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontFamily: 'RobotoMono',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 9.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets
                                                                                      .only(
                                                                                    left: 20.0,
                                                                                  ),
                                                                                  child: Text(
                                                                                    '${snapshot
                                                                                        .data
                                                                                        .docs[i]
                                                                                        .data()['About']}',
                                                                                    style: const TextStyle(
                                                                                      color: Colors
                                                                                          .black,
                                                                                      fontSize: 15.0,
                                                                                      fontWeight: FontWeight
                                                                                          .w500,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 20.0,
                                                                                ),
                                                                                const Padding(
                                                                                  padding: EdgeInsets
                                                                                      .only(
                                                                                    left: 20.0,
                                                                                  ),
                                                                                  child: Text(
                                                                                    'Appointments',
                                                                                    style: TextStyle(
                                                                                      color:  Color(0xFF0876D4),
                                                                                      fontSize: 20.0,
                                                                                      fontWeight: FontWeight
                                                                                          .w800,
                                                                                      fontFamily: 'Monospace',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(padding: const EdgeInsets.all(12.0),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      TimelineTile(
                                                                                        indicatorStyle: const IndicatorStyle(
                                                                                          color: Colors
                                                                                              .indigo,
                                                                                          height: 50,
                                                                                          width: 50,
                                                                                          indicator: CircleAvatar(
                                                                                            backgroundColor: Color(
                                                                                                0xFF326fa5),
                                                                                            child: Text('1',
                                                                                              style: TextStyle(
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 20,
                                                                                                  fontWeight: FontWeight.w900
                                                                                              ),),
                                                                                          ),
                                                                                        ),
                                                                                        isFirst: true,
                                                                                        endChild: Padding(
                                                                                          padding: const EdgeInsets.only(
                                                                                            left: 10.0,
                                                                                          ),
                                                                                          child: Material(
                                                                                            shadowColor: const Color(0xFF326fa5),
                                                                                            elevation: 20,
                                                                                            borderRadius: BorderRadius.circular(30.0),
                                                                                            child: Container(
                                                                                              height: 60,
                                                                                              padding: const EdgeInsets.all(19.0),
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(40.0),
                                                                                                gradient: const LinearGradient(
                                                                                                  begin: Alignment.topRight,
                                                                                                  end: Alignment.topLeft,
                                                                                                  colors: [
                                                                                                    // Color(0xAA9696C8),
                                                                                                    // Color(0xAAEBE6EC),
                                                                                                    // Color(0xAAf3e5f5),
                                                                                                    Color(0xAAf3e5f5),
                                                                                                    Color(0xAAEBE6EC),
                                                                                                    Color(0xAA9696C8),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              child: MaterialButton(
                                                                                                onPressed: (){
                                                                                                  day('Monday');
                                                                                                  doctorN(snapshot.data.docs[i].data()['Name']);
                                                                                                  datePickerMonday(context);
                                                                                                  Navigator.of(context).pushNamed('booking',);
                                                                                                },
                                                                                                child: const Center(
                                                                                                    child: Text(
                                                                                                      '2 - 4 pm Monday',
                                                                                                      style: TextStyle(
                                                                                                        color: Colors.indigo,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontSize: 15.0,
                                                                                                      ),)),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        height: 10.0,
                                                                                      ),
                                                                                      TimelineTile(
                                                                                        indicatorStyle: const IndicatorStyle(
                                                                                          height: 50,
                                                                                          width: 50,
                                                                                          indicator: CircleAvatar(
                                                                                            backgroundColor: Color(
                                                                                                0xFF326fa5),
                                                                                            child: Text(
                                                                                              '2',
                                                                                              style: TextStyle(
                                                                                                  color: Colors
                                                                                                      .white,
                                                                                                  fontSize: 20,
                                                                                                  fontWeight: FontWeight
                                                                                                      .w900
                                                                                              ),),
                                                                                          ),
                                                                                        ),
                                                                                        //isFirst: true,
                                                                                        endChild: Padding(
                                                                                          padding: const EdgeInsets.only(
                                                                                            left: 10.0,
                                                                                          ),
                                                                                          child: Material(
                                                                                            shadowColor: const Color(0xFF326fa5),
                                                                                            elevation: 20,
                                                                                            borderRadius: BorderRadius.circular(30.0),
                                                                                            child: Container(
                                                                                              height: 60,
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
                                                                                              child: MaterialButton(
                                                                                                onPressed: () {
                                                                                                  day('Tuesday');
                                                                                                  doctorN(snapshot.data.docs[i].data()['Name']);
                                                                                                  datePickerTuesday(context);
                                                                                                  Navigator.of(context).pushNamed('booking',);
                                                                                                },
                                                                                                child: const Center(
                                                                                                    child: Text(
                                                                                                      '2 - 4 pm Tuesday',
                                                                                                      style: TextStyle(
                                                                                                        color: Colors.indigo,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontSize: 15.0,
                                                                                                      ),)),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        height: 10.0,
                                                                                      ),
                                                                                      TimelineTile(
                                                                                        indicatorStyle: const IndicatorStyle(
                                                                                          height: 50,
                                                                                          width: 50,
                                                                                          indicator: CircleAvatar(
                                                                                            backgroundColor: Color(0xFF326fa5),
                                                                                            child: Text('3',
                                                                                              style: TextStyle(
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 20,
                                                                                                  fontWeight: FontWeight.w900
                                                                                              ),),
                                                                                          ),
                                                                                        ),
                                                                                        isLast: true,
                                                                                        endChild: Padding(
                                                                                          padding: const EdgeInsets
                                                                                              .only(
                                                                                            left: 10.0,
                                                                                          ),
                                                                                          child: Material(
                                                                                            shadowColor: const Color(
                                                                                                0xFF326fa5),
                                                                                            elevation: 20,
                                                                                            borderRadius: BorderRadius
                                                                                                .circular(
                                                                                                30.0),
                                                                                            child: Container(
                                                                                              height: 60,
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
                                                                                              child: MaterialButton(
                                                                                                onPressed: () {
                                                                                                  day('Wednesday');
                                                                                                  doctorN(snapshot.data.docs[i].data()['Name']);
                                                                                                  datePickerWednesday(context);
                                                                                                  Navigator.of(context).pushNamed('booking',);
                                                                                                },
                                                                                                child: const Center(
                                                                                                    child: Text(
                                                                                                      '2 - 4 pm Wednesday',
                                                                                                      style: TextStyle(
                                                                                                        color: Colors.indigo,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontSize: 15.0,
                                                                                                      ),)),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                            }),
                                                      ),
                                                ),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      } ,
                                      separatorBuilder: (context, index) {return Container(height: 15.0,);},
                                    );
                                  } else {
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
      ),);
  }}

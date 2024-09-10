import 'package:blue_medical_clinic/modules/doctor_part/home_layout_doc/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/patien_part/home_Layout/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/patien_part/home_Layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class home_layout extends StatefulWidget {

  @override
  _home_layoutState createState() => _home_layoutState();
}

class _home_layoutState extends State<home_layout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>DoctorHomeCubit(),

      child: BlocConsumer<PatientHomeCubit,PatientHomeStates>(
          listener: (context,state){},
          builder:  (context,state){
            PatientHomeCubit cub=PatientHomeCubit.get(context);
            return Scaffold
              (

              body:cub.screen[cub.currentScreen],
              bottomNavigationBar:BottomNavigationBar(
                currentIndex:cub.currentScreen,
                onTap:(index){
                  cub.changeNav(index);
                },
                items:cub.bottmsItem,
              ) ,
              // bottomNavigationBar:
              // BottomAppBar(
              //   elevation: 30,
              //   //key: index,
              //   shape: CircularNotchedRectangle(),
              //   notchMargin: 5,
              //   color:Color(0xAA93F0FC),
              //   child:Container(
              //     decoration:BoxDecoration(
              //       gradient: LinearGradient(
              //           begin:Alignment.bottomCenter,
              //           //end:Alignment.topCenter,
              //           colors:[
              //             Color(0xC218DE),
              //             Color(0xC218DE),
              //           ]
              //       ),
              //
              //     ),
              //     child: Row(
              //       mainAxisSize:MainAxisSize.min,
              //       mainAxisAlignment:MainAxisAlignment.spaceBetween,
              //
              //       children:[
              //         IconButton(
              //             icon:Icon(Icons.home),
              //             color: Colors.blueGrey[100],
              //             onPressed:(){
              //               index=0;
              //               cub.changeNav(index);
              //             }
              //         ),
              //
              //         IconButton(
              //             icon:Icon(Icons.settings),
              //             color: Colors.blueGrey[100],
              //             onPressed:(){
              //               index=1;
              //               cub.changeNav(index);
              //             }
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            );}
      ),
    );
  }
}

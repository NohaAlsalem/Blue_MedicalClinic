// import 'package:blue_medical_clinic/modules/doctor_part/appoentment/cubit/cubit.dart';
// import 'package:blue_medical_clinic/modules/doctor_part/appoentment/cubit/states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class my_time extends StatelessWidget {
//
//   final String ?name;
//   final String ?time;
//   final int ?id;
//   my_time({
//     @required this.name,
//     @required this.time,
//     @required this.id,
//   });
//   void selectreport(BuildContext context, r) {
//     Navigator.of(context).pushNamed('$r',
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return
//       BlocProvider(
//         create: (BuildContext context)=>appointment(),
//         child: BlocConsumer<appointment,times_states>(
//           listener: (context,states){},
//           builder:(context,states){
//             appointment cub=appointment.get(context);
//             return InkWell(
//
//             //    key:key!(model[id].toString()),
//             //onTap:()=>selectreport(context,'dp'),
//             child: Padding(
//               padding: const EdgeInsetsDirectional.only(
//                   start: 20.0, end: 20.0, top: 0.0, bottom: 20.0),
//               child: Material(
//                 shadowColor: const Color(0xFF326fa5),
//                 elevation: 20,
//                 borderRadius: BorderRadius
//                     .circular(
//                     30.0),
//                 child: Container(
//                     height: 60.0,
//                     width: double.infinity,
//                     child: Dismissible(
//                       key:Key(id.toString()),
//                       onDismissed:(direction){
//                         cub.delete(id);
//                       },
//                       child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Color(0xFF326fa5),
//                               radius: 30.0,
//                               child: Text(
//                                   '$time', style: TextStyle(color: Color(0xAAf3e5f5),)),
//                             ),
//                             SizedBox(width: 10.0),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 //mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Text('$name', style: TextStyle(
//                                     color: Color(0xAA420168),
//                                     fontSize: 20.0,
//                                     fontWeight: FontWeight.bold,
//                                   )),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(width: 10.0),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(top: 8.0,end:10.0),
//                               child: IconButton(
//
//                                 icon: Icon(cub.iconcheck, color: Color(0xAA420168),),
//                                 onPressed: () {
//                                   if(cub.no_check==true){
//                                   cub.changeIcon(Icons.check_box,false);
//                                   cub.show_dialog(context);
//                                   }
//                                   else {
//                                     cub.changeIcon(Icons.check_box_outline_blank_outlined,true);
//                                   }
//                                 },
//                               ),
//                             ),
//                             // IconButton(
//                             //
//                             //   icon: Icon(Icons.check_circle_outline, color: Color(0xAA420168),),
//                             //   onPressed: () {},
//                             // ),
//
//                           ]
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         begin: Alignment.topRight,
//                         end: Alignment.topLeft,
//                         colors: [
//                           Color(0xAAf3e5f5),
//                           //Color(0xAAEBE6EC),
//                           Color(0xAA9696C8),
//                         ],
//                       ),
//
//                       borderRadius: BorderRadius.circular(50.0),
//                       //boxShadow: BoxShadow(color: Colors.grey,),
//                     )
//                 ),
//               ),
//             ),
//
//     );}
//         ),
//       );
//   }
// }
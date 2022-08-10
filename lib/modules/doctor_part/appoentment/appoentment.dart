// import 'package:blue_medical_clinic/modules/doctor_part/appoentment/class_times.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// class page_times extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:Container(
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Color(0xAAf3e5f5),
//                   Color(0xAA93f0fc),
//                   Color(0xAAd1c4e9),
//                   Color(0xAAf3e5f5),
//                 ],
//               ),
//             ),
//             child:Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(flex:1,
//                     child: Container(
//                       width:double.infinity,
//                       decoration:BoxDecoration(
//                         color: Color(0xFF326fa5),
//                         borderRadius:BorderRadius.only(bottomLeft:Radius.circular(40.0),bottomRight:Radius.circular(40.0)),
//                       ),
//                       clipBehavior:Clip.antiAliasWithSaveLayer,
//                       child:Card(
//                         shadowColor:const Color(0xAA420168),
//                         elevation: 20,
//
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//                         color:Color(0xAA93f0fc),
//
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
//
//                         ),
//                         //child:Lottie.asset('assets/appointment.json',fit: BoxFit.contain) ,
//                         child: Image(image:AssetImage('assets/vv.jpg'),fit:BoxFit.cover,)
//                       ),
//                     ),
//                   ),
//                   // Expanded(flex:2,
//                   //   child: Stack(
//                   //     children: [
//                   //       Container(
//                   //         height: 215.0,
//                   //         decoration: BoxDecoration(
//                   //           borderRadius: BorderRadius.vertical(
//                   //             bottom: Radius.elliptical(
//                   //                 MediaQuery.of(context).size.width,115.0
//                   //             ),
//                   //           ),
//                   //           color:Color(
//                   //               0xFF326fa5),
//                   //         ),
//                   //       ),
//                   //       Container(
//                   //         height: 200.0,
//                   //         decoration: BoxDecoration(
//                   //           borderRadius: BorderRadius.vertical(
//                   //             bottom: Radius.elliptical(
//                   //                 MediaQuery.of(context).size.width,100.0
//                   //             ),
//                   //           ),
//                   //           image:const DecorationImage(
//                   //             image:AssetImage('assets/book-an-appointment.json'),
//                   //             fit: BoxFit.cover,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   SizedBox(height: 30,),
//                   Padding(
//                     padding: const EdgeInsetsDirectional.only(start: 20.0, end: 20.0, top: 0.0, bottom:0.0),
//                     child: Text('appointments today', style: TextStyle(
//                       fontSize: 23.0,
//                       color: Color(0xFF326fa5),
//                       fontWeight: FontWeight.w800,
//                     ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 3,
//                     child: ListView.separated(
//                       itemBuilder:(context,index)
//                       {
//                         return my_time(
//                           name: appointments[index].name,
//
//                           time: appointments[index].time,
//                         );},
//                       separatorBuilder: (context,index)=>SizedBox(),
//                       itemCount:appointments.length,
//
//                     ),
//                   ),
//                 ]))
//     );
//   }
// }

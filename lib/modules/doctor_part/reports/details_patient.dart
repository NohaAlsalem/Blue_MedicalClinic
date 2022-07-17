import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/list_reports/list_report.dart';
import 'contain_report.dart';

class details_patient extends StatelessWidget {
  //static const routeName = 'patient_details';

  @override
  text(String d,String t) {
    return Row(
      children: [
    Text(
    '$d :',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        //color: Color(0xAA420168),
      ),
    ),
    Text(
    ' $t',
    style: TextStyle(
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

  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final selcteed = areports.firstWhere((w) => w.id == id);

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
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
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xAAd1c4e9),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Stack(

                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top:10.0,start:15.0,end: 15.0),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(child: Container(
                            height: 30.0,
                            decoration:BoxDecoration(
                              color:Color(0xFF326fa5) ,
                              // gradient: const LinearGradient(
                              //   begin: Alignment.topRight,
                              //   end: Alignment.bottomRight,
                              //   colors: [
                              //     Color(0xAA93f0fc),
                              //    // Color(0xAAf3e5f5),
                              //     Color(0xAA93f0fc),
                              //     //Color(0xAAd1c4e9),
                              //     //Color(0xAAf3e5f5),
                              //   ],
                              // ),
                              borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(selcteed.name,style: TextStyle(color: Color(0xAAf3e5f5),fontSize: 20.0,fontWeight: FontWeight.bold),),
                            ),
                          ),),
                          space(20.0,0.0),
                          Row(children: [
                            //here row for add image or icon discrip
                            text('age', '${selcteed.age}'),
                          ],),
                          space(8.0,0.0),
                          Row(children: [
                            text('gender', selcteed.gender),
                          ],),
                          space(8.0,0.0),
                          Row(children: [
                            text('bloodtype', selcteed.bloodtype),
                          ],),
                          space(8.0,0.0),
                          Row(children: [
                            text('last visiting time',selcteed.time),],),
                          space(8.0,0.0),
                          Row(children: [
                            text('date of last visit',selcteed.date),
                          ],),
                          space(8.0,0.0),
                          Row(children: [
                            text('medical condtion',selcteed.paitent_report),
                          ],),
                          space(8.0,0.0),
                          Row(children: [
                            text('discription',''),
                          ],),
                          space(8.0,0.0),
                          Expanded(flex: 1,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder:(context,index)
                              {
                                return contain(
                                  id: contain_report[index].id,
                                  discrip:contain_report[index].discrip,
                                  Imagename: contain_report[index].Imagename,
                                  text: contain_report[index].text,
                                );},
                              separatorBuilder: (context,index)=>SizedBox(),
                              itemCount: contain_report.length,
                            ),
                          ),
                          // Expanded(
                          //   flex:1,
                          //   child: Padding(
                          //     padding: const EdgeInsetsDirectional.only(end: 20.0,bottom: 20.0,top: 10.0),
                          //     child: Container(
                          //       width: double.infinity,
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(15.0),
                          //         child: Text('${selcteed.discrption}'),
                          //       ),
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(30),
                          //         color:  Color(0xAAf3e5f5),
                          //       ),
                          //     ),
                          //   ),
                          // ),

                        ],
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
}

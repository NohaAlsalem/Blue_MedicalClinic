import 'package:flutter/material.dart';

import '../../models/list_reports/list_report.dart';
import '../../shared/components/components.dart';
class reports extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration:BoxDecoration(

            gradient:LinearGradient(
              begin:Alignment.bottomLeft,
              end:Alignment.bottomRight,
              colors:[
                Color(0xAAf3e5f5),
                Color(0xAA93f0fc),
                Color(0xAAf3e5f5),
                Color(0xAA93f0fc),

              ],
            ),
          ),
          child:Column(
            children: [
          Expanded(flex:1,
            child: Container(
            width:double.infinity,
              //height:100.0,
            decoration:BoxDecoration(
                gradient:LinearGradient(
                  begin:Alignment.topRight,
                  end:Alignment.bottomRight,
                  colors:[
                    Color(0xAA93f0fc),
                    Color(0xAAf3e5f5),
                    Color(0xAA93f0fc),
                    Color(0xAAf3e5f5),
                  ],
                ),
                borderRadius:BorderRadius.only(bottomLeft:Radius.circular(40.0),bottomRight:Radius.circular(40.0)),
            ),
              clipBehavior:Clip.antiAliasWithSaveLayer,
              child:Image(image:AssetImage('asset/report.jpg'),fit:BoxFit.cover,),
              ),
          ),
              SizedBox(height:20.0),
              Expanded(
                flex:3,
                child: ListView.separated(
                 // padding:const EdgeInsetsDirectional.only(top:0.0),
                    itemBuilder:(context,index)=>Padding(
                      padding: const EdgeInsetsDirectional.only(bottom:5.0,start:20.0,end:20.0),
                      child: InkWell(
                        onTap:(){
                         // Navigator.push(context,MaterialPageRoute(builder: (context)=>writeReport()));
                        },
                          child: defaultitmebuilder(areports[index],context)),
                    ),
                    separatorBuilder:(context,index)=>SizedBox(height:20.0),
                    itemCount:areports.length),
              ),

        ],
      ),
          ),
    );
  }
}

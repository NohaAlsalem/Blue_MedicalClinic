import 'package:flutter/material.dart';

class report extends StatelessWidget {
  final String id;
  final String name;
  final String date;
  final String time;
  final String paitent_report;
  final String gender;
  final int age;
  final String bloodtype;



  const report({
    required this.id,
    required this.name,
    required this.date,
    required this.time,
    required this.paitent_report,
    required this.gender,
    required this.age,
    required this.bloodtype,

  });

  void selectreport(BuildContext context, r) {
    Navigator.of(context).pushNamed('$r',
      //details_patient.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap:()=>selectreport(context,'dp'),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 20.0, end: 20.0, top: 0.0, bottom: 20.0),
        child: Material(
          shadowColor: const Color(0xFF326fa5),
          elevation: 20,
          borderRadius: BorderRadius
              .circular(
              30.0),
          child: Container(
              height: 60.0,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFF326fa5),
                      radius: 30.0,
                      child: Text(
                          '$time', style: TextStyle(color: Color(0xAAf3e5f5),)),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('$name', style: TextStyle(
                            color: Color(0xAA420168),

                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                          SizedBox(height: 5.0),
                          Text('$date', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    IconButton(

                      icon: Icon(Icons.edit, color: Color(0xAA420168),),
                      onPressed: () => selectreport(context, 'writeReport'),
                    ),

                  ]
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xAAf3e5f5),
                    //Color(0xAAEBE6EC),
                    Color(0xAA9696C8),
                  ],
                ),

                borderRadius: BorderRadius.circular(50.0),
                //boxShadow: BoxShadow(color: Colors.grey,),
              )
          ),
        ),
      ),
    );
  }
}





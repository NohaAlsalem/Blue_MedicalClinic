import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class contain extends StatelessWidget {
  int id;
  final String discrip;
  final String ?Imagename;
  final String ?text;
  contain({
    required this.id,
      required this.discrip,
    this.text,
    this.Imagename,
});

  void selectcontain(BuildContext context, r) {
    Navigator.of(context).pushNamed('$r',
      //details_patient.routeName,
      arguments: id,
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showDialog(context: context,
            builder:(BuildContext ctx){
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: ConditionalBuilder(
                condition:text !=null,
                builder:(context){return Padding(
                  padding: const EdgeInsetsDirectional.only(top: 8.0,start:20.0,end: 20.0),
                  child: Text('$text'),
                );},
                fallback: (context){return Container(
              //width: 210,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(40)),
              child: Image(image:AssetImage('asset/images/$Imagename',),fit: BoxFit.cover,));},
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color(0xAAd1c4e9),
              //   gradient: const LinearGradient(
              //       begin: Alignment.topRight,
              //       end: Alignment.bottomRight,
              //       colors: [
              //   Color(0xAA9696C8),
              //   Color(0xAAEBE6EC),
              //   Color(0xAAf3e5f5),
              //   Color(0xAAf3e5f5),
              //   Color(0xAAEBE6EC),
              //   Color(0xAA9696C8),
              // ]),
              )
            ),
          );});
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 210.0,
          child: Card(
            shadowColor:const Color(0xAA93f0fc),
            elevation: 20,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color:Color(0xAAd1c4e9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),

            ),
            child: Column(
              children: [
                Expanded(flex: 4,
                    child:
                    ConditionalBuilder(
                      condition:text !=null,
                        builder:(context){return Padding(
                          padding: const EdgeInsetsDirectional.only(top: 6.0,start:6.0,end: 6.0),
                          child: Text('$text'),
                        );},
                        fallback: (context){return Container(
                          width: 210,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20))),
                            child: Image(image:AssetImage('asset/images/$Imagename',),fit: BoxFit.cover,));},
                    ),
                ),
                Expanded(flex: 1,
                  child: Container(
                    width:210.0,
                    //color: Color(0xAA93f0fc),
                    color: Color(0xFF326fa5),
                    child: Center(child: Text('$discrip',style: TextStyle(color: Color(0xAAf3e5f5)),)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

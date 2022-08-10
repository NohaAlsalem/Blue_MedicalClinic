import 'package:blue_medical_clinic/modules/doctor_part/appoentment/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class appointment extends Cubit<times_states>{
  appointment():super(ineitial_state());
  static appointment get(Context)=>BlocProvider.of(Context);

  IconData iconcheck=Icons.check_box_outline_blank_outlined;
  bool no_check=false;
  void changeIcon(icon,check){
    iconcheck=icon;
    no_check=check;
    emit(change_Icon());
  }
  int key=1;
  delete(id){


    emit(delete_Appointment());
  }

  void show_dialog(context){
    showDialog(context: context,
      builder: (context){
      return  AlertDialog(
        //title: Text(''),
        content: Container(
          width: 80.0,
          height: 40.0,
          child: Material(
            color:  Color(0xAAf3e5f5),
            shadowColor: const Color(0xFF326fa5),
            elevation: 20,
            borderRadius: BorderRadius.circular(40.0),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context,'report');
              },
              child: Center(
                child: Text(
            'show Report',
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
                fontFamily: 'The Life-Serif',
            ),),
              ),
              //child:
              // ListTile(
              //     leading: Icon(Icons.image),
              // title: Center(child: Text('show report')),
              // onTap: () {
              // }),

              // child: Container(
              //   height: 60,
              //   width:80.0 ,
              //   padding: const EdgeInsets.all(19.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(40.0),
              //     gradient: const LinearGradient(
              //       begin: Alignment.topRight,
              //       end: Alignment.topLeft,
              //       colors: [
              //         // Color(0xAA9696C8),
              //         // Color(0xAAEBE6EC),
              //         // Color(0xAAf3e5f5),
              //         Color(0xAAf3e5f5),
              //         Color(0xAAEBE6EC),
              //         Color(0xAA9696C8),
              //       ],
              //     ),
              //   ),
                // child: const Center(
                //   child:Text(
                //     'show Report',
                //     style: TextStyle(
                //     //  color: Colors.indigo,
                //       color: Colors.black,
                //       fontWeight: FontWeight.w500,
                //       fontSize: 20.0,
                //       fontFamily: 'The Life-Serif',
                //     ),),
              //),
            ),
          ),
        ),
      );
      },
    );
    emit(show_Dialog());
  }

}
import 'package:blue_medical_clinic/modules/patien_part/home_Layout/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/patien_part/home_Layout/cubit/states.dart';
import 'package:blue_medical_clinic/shared/components/components.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class home_layout extends StatefulWidget {

  @override
  _home_layoutState createState() => _home_layoutState();
}

class _home_layoutState extends State<home_layout> {
 var fcmToken = FirebaseMessaging.instance;
  @override
  void initState(){
    fcmToken.getToken().then((value) {
      print('token in home *_*');
    });
    FirebaseMessaging.onMessage.listen((event) {
      print('notification title : ${event.notification!.title}');
      print('notification body : ${event.notification!.body}');
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      navigateTo(home_layout(), context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>PatientHomeCubit(),

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
        );}
      ),
    );
  }
}

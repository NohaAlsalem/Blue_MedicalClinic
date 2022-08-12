import 'package:blue_medical_clinic/modules/chosse_the_user_type/chosse_user.dart';
import 'package:blue_medical_clinic/modules/patien_part/home_Layout/home_layout.dart';
import 'package:blue_medical_clinic/modules/patien_part/login_screen/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class SplashScreen extends StatefulWidget {
   const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _navigateToHome();
    //LoginPatientCubit.get(context).getslectedpref();
  }
   //String? signed;
  // Widget? _widget;
  // String token = access_token;
  // if(
  // token != null
  // ){
  //   // navigate to home
  // }else{
  // navigate to choose user
  // }

  _navigateToHome()async{
    await Future.delayed(const Duration(seconds: 5) , (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ConditionalBuilder(
        condition:LoginPatientCubit.get(context).preff ==null,
        builder:(context){return ChosseUser();},
        fallback: (context){return home_layout();},
        )));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration:  const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter ,
                colors: [
                  Color(0xAA1a76b5),
                  Color(0xAAf3e5f5),
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    border: Border.all(color:  const Color(0xAAf3e5f5),
                        width: 5),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image:  const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/blue_logo.jpg'),
                    )
                ),
              ),
              const SizedBox(height : 10),
              const Text('Blue Medical Clinic',
                  style: TextStyle(
                    color :Color(0xFF0876D4),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.white,
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
              )),
              const SizedBox(height: 20,),
              SpinKitWave(
                itemBuilder: (BuildContext context,
                    int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? const Color(0xFF0876D4)
                          : const Color(0xAAf3e5f5),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

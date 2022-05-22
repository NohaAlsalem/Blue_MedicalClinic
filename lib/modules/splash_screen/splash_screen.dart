import 'package:blue_medical_clinic/modules/chosse_the_user_type/chosse_user.dart';
import 'package:flutter/cupertino.dart';
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
  }
  _navigateToHome()async{
    await Future.delayed(const Duration(seconds: 5) , (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ChosseUser()));
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
                  Color(0xff93f0fc),
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
                fontSize: 23,
                fontWeight: FontWeight.bold,
              )),
              const SizedBox(height: 20,),
              SpinKitWave(
                itemBuilder: (BuildContext context,
                    int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? const Color(0xff93f0fc)
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

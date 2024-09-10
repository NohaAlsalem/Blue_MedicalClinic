import 'package:blue_medical_clinic/modules/splash_screen/splash_screen.dart';
import 'package:blue_medical_clinic/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff93f0fc),
                    Color(0xAAf3e5f5),
                  ]),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 300,),
                    Text(
                      'User email : ${FirebaseAuth.instance.currentUser!.email} ',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20,),
                    defaultMaterialButton(buttonText: 'Logout', function: (){
                      _signOut();
                      navigateAndFinish(SplashScreen(), context);
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

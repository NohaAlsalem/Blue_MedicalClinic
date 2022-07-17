import 'package:blue_medical_clinic/modules/user.type.screens/doctor_screens/doctor_login_screen/doctor_login_screen.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/login_screen/login_screen.dart';
import 'package:blue_medical_clinic/shared/components/components.dart';
import 'package:flutter/material.dart';

class ChosseUser extends StatefulWidget {
  const ChosseUser({Key? key}) : super(key: key);

  @override
  State<ChosseUser> createState() => _ChosseUserState();
}

class _ChosseUserState extends State<ChosseUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            const SizedBox(height : 20),
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
            const SizedBox(height: 70,),
            defaultMaterialButton(
                containerColor: Color(0xAA1a76b5),
                width: double.infinity,
                buttonText: 'Patient',
                textColor: Colors.white,
                function: () {
                  navigateTo(PatientLoginScreen(), context);
                }),
            const SizedBox(height : 32),
            defaultMaterialButton(
                containerColor: Color(0xAA1a76b5),
                width: double.infinity,
                buttonText: 'Doctor',
                textColor: Colors.white,
                function: () {
                  navigateTo( DoctorLoginScreen(), context);
                }),
          ],
        ),
      ),
    );
  }
}
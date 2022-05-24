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
                Color(0xff93f0fc),
                Color(0xAAf3e5f5),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            defaultMaterialButton(
              containerColor: Colors.cyan[200],
              width: double.infinity,
                buttonText: 'Patient',
                textColor: const Color(0xAA420168),
                function: () {
                    navigateTo(PatientLoginScreen(), context);
                }),
            const SizedBox(height : 20),
            defaultMaterialButton(
                containerColor: Colors.cyan[200],
                width: double.infinity,
                buttonText: 'Doctor',
                textColor: const Color(0xAA420168),
                function: () {
                  navigateTo( DoctorLoginScreen(), context);
                }),
          ],
        ),
      ),
    );
  }
}

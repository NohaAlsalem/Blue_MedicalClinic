import 'package:blue_medical_clinic/modules/doctor_part/home/home_screen.dart';
import 'package:blue_medical_clinic/modules/doctor_part/reports/test.dart';
import 'package:blue_medical_clinic/modules/doctor_part/reports/write_report/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/doctor_screens/doctor_login_screen/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/home_screen/home_screen/home_screen.dart';
import 'package:blue_medical_clinic/shared/components/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'cubit/states.dart';

class DoctorLoginScreen extends StatelessWidget {
  DoctorLoginScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var name='Dr.Amal AL-Masry';
  CollectionReference docRefGastroenterology = FirebaseFirestore.instance.collection('Section').doc('Doctors').collection('Gastroenterology ');
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
    BlocProvider(create: (context) =>  LoginDoctorCubit(),),
    BlocProvider(create: (context) => PatientReport(),),
      ],
      child: BlocProvider(
        create: (BuildContext context) => LoginDoctorCubit(),
        child: BlocConsumer<LoginDoctorCubit, DoctorLoginStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            var cubit = LoginDoctorCubit.get(context);
            return Scaffold(
              body: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    Color(0xAA1a76b5),
                    Color(0xAAf3e5f5),
                    Color(0xff93f0fc),
                  ]),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 90),
                     // const Header(),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(height: 40),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]!)),
                                          ),
                                          child: defaultTextFormField(
                                            isPassword: false,
                                            keyBoardType:
                                                TextInputType.emailAddress,
                                            // validate: (value) {
                                            //   if (value!.isEmpty) {
                                            //     return 'Empty Field , please enter your email';
                                            //   } else if (!value
                                            //       .contains('@gmail.com')) {
                                            //     return 'Invalid Email , please Enter a valid email';
                                            //   } else {
                                            //     return null;
                                            //   }
                                            // },
                                            controller: emailController,
                                            prefixIcon: Icons.alternate_email,
                                            textInputAction: TextInputAction.next,
                                            label: 'Doctor E-mail',
                                            hint: 'DoctorMail@gmail.com',
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]!)),
                                          ),
                                          child: defaultTextFormField(
                                            isPassword: cubit.showPassword,
                                            keyBoardType:
                                                TextInputType.visiblePassword,
                                            validate: (value) {
                                              if (value!.isEmpty) {
                                                return 'Empty Field , please enter your password';
                                              } else if (value.length < 6) {
                                                return 'Too short, password should be more than 6 ';
                                              } else if (value.length > 16) {
                                                return 'Too long, password should be less than 6 ';
                                              } else {
                                                return null;
                                              }
                                            },
                                            controller: passwordController,
                                            prefixIcon: Icons.lock,
                                            suffixIcon: cubit.suffixIcon,
                                            suffixIconFun: () {
                                              cubit.changePasswordVisibility();
                                            },
                                            textInputAction: TextInputAction.done,
                                            label: 'Doctor Password',
                                            hint: '********',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 120,
                                  ),
                                  ConditionalBuilder(
                                    condition:
                                    state is! DoctorLoginLoadingState,
                                      builder: (BuildContext ctx) =>
                                          defaultMaterialButton(
                                              buttonText: 'LOGIN',
                                              function: () {
                                                if (formKey.currentState!.validate())
                                                {

                                                  if(emailController=='Dr..Musallam AL-Kayal'){
                                                    navigateAndFinish(
                                                        DoctorHome(PatientReport.get(ctx).getDataMusallam(context)),
                                                        context);}
                                                  if(name=='Dr.Ahmad AL-jarrah'){
                                                    navigateAndFinish(
                                                      DoctorHome(PatientReport.get(ctx).getDataAhmad(context)),
                                                      context);}
                                                if(name=='Dr.Amal AL-Masry'){
                                                  PatientReport.get(ctx).getDataAmal(context);
                                                // navigateAndFinish (
                                                // DoctorHome(PatientReport.get(ctx).getDataAmal(context) as Future<dynamic>),
                                                // context);
                                                  }
                                                  if(name=='Dr.Hassan AL-Maleh'){
                                                    navigateAndFinish(
                                                        DoctorHome(PatientReport.get(ctx).getDataHassan(context)),
                                                        context);
                                                  }
                                                  if(name=='Dr.Fahad AL-Ebrahem'){
                                                    navigateAndFinish(
                                                        DoctorHome(PatientReport.get(ctx).getDataFahad(context)),
                                                        context);
                                                  }
                                                  if(name=='Dr.Ali Ahmad'){
                                                    navigateAndFinish(
                                                        DoctorHome(PatientReport.get(ctx).getDataAli(context)),
                                                        context);
                                                  }
                                                  if(name=='Dr. Nedal Hussain'){
                                                    navigateAndFinish(
                                                        DoctorHome(PatientReport.get(ctx).getDataNedal(context) ),
                                                        context);
                                                  }
                                                  if(name=='Dr.Mohammad Kasem'){
                                                    navigateAndFinish(
                                                        DoctorHome(PatientReport.get(ctx).getDataMKassem(context)),
                                                        context);
                                                  }
                                                  if(name=='Dr.Mohammad Saeed'){
                                                    navigateAndFinish(
                                                        DoctorHome(PatientReport.get(ctx).getDataMSaeed(context)),
                                                        context);
                                                  }
                                                  if(name=='Dr.Naser Mohammad.'){
                                                    navigateAndFinish(
                                                        DoctorHome(PatientReport.get(ctx).getDataNaser(context)),
                                                        context);
                                                  }


                                                 // return LoginDoctorCubit.get(context).nameDoctor();
                                                  //if ( '${data.docs[i].data()['Name']}'==)
                                                  // navigateAndFinish(
                                                  //     Report(),
                                                  //     context);
                                                }
                                                //return PatientReport.get(context).Navigation();

                                                }),
                                      fallback: (BuildContext context) =>
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
                                          )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

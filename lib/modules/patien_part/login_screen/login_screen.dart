import 'package:blue_medical_clinic/modules/patien_part/home_Layout/home_layout.dart';
import 'package:blue_medical_clinic/modules/patien_part/login_screen/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/patien_part/login_screen/cubit/states.dart';
import 'package:blue_medical_clinic/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PatientLoginScreen extends StatefulWidget {
  PatientLoginScreen({Key? key}) : super(key: key);

  @override
  State<PatientLoginScreen> createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<PatientLoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  var fcmToken = '';

  @override
  void initState() async {
    await FirebaseMessaging.instance.getToken().then((value) {
      fcmToken = value.toString();
      print('FCM TOKEN IS  : ${fcmToken}');
    }).catchError((error) {
      print('error in init state , error is , ${error.toString()}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginPatientCubit(),
      child: BlocConsumer<LoginPatientCubit, PatientLoginStates>(
        listener: (BuildContext context, state) {
          if (state is PatientLoginSuccessState) {
            navigateAndFinish(home_layout(), context);
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = LoginPatientCubit.get(context);
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
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return ' Empty Failed , please enter your email';
                                            }
                                            if (!value
                                                .contains('bluePat.net')) {
                                              return ' Invaild E-mail , please enter a valid email ';
                                            }
                                          },
                                          controller: emailController,
                                          prefixIcon: Icons.alternate_email,
                                          textInputAction: TextInputAction.next,
                                          label: 'Patient E-mail',
                                          hint: 'PatientMail@bluemedical.cl',
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
                                          label: 'Patient Password',
                                          hint: '********',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 90,
                                ),
                                ConditionalBuilder(
                                    builder: (BuildContext context) =>
                                        defaultMaterialButton(
                                            buttonText: 'LOGIN',
                                            function: () async {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                cubit.patientLogin(
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text,
                                                    fcmToken: fcmToken);
                                              }
                                            }),
                                    condition:
                                        state is! PatientLoginLoadingState,
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
                                  height: 90,
                                ),
                                Row(
                                  children: [
                                    const Text('Don\'t have an Account ? '),
                                    const SizedBox(width: 10),
                                    defaultTextButton(
                                      function: () {
                                        // navigateTo(
                                        //     PatientRegisterScreen(), context);
                                      },
                                      buttonText: 'Register Now',
                                      fontSize: 17,
                                    )
                                  ],
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
    );
  }
}

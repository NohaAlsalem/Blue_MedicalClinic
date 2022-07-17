
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/home_screen/home_screen.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/register_screen/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/register_screen/cubit/states.dart';
import 'package:blue_medical_clinic/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PatientRegisterScreen extends StatelessWidget {
   PatientRegisterScreen({Key? key}) : super(key: key);
   final nameController = TextEditingController();
   final emailController = TextEditingController();
   final phoneController = TextEditingController();
   final passwordController = TextEditingController();
   final confirmController = TextEditingController();
   final formKey = GlobalKey<FormState>();
   @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterPatientCubit(),
      child: BlocConsumer<RegisterPatientCubit, PatientRegisterStates>(
        listener: (BuildContext context, state) {
          if(state is CreatePatientSuccessState){
            navigateAndFinish( PatientHomeScreen(), context);
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = RegisterPatientCubit.get(context);
          return Scaffold(
          backgroundColor: Colors.cyanAccent[900],
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.grey[50],
            flexibleSpace: Container(
              decoration:  const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xAA1a76b5),
                  Color(0xAA1a76b5),
                  Color(0xAAf3e5f5),
                ])
              ),
            ),
          ),
          body: Form(
            key : formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration : BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color : Colors.grey[200]!)
                        ),
                      ),
                      child: defaultTextFormField(
                        isPassword: false,
                        keyBoardType: TextInputType.name,
                        validate: (value){  if(value!.isEmpty){return 'Empty Field , please enter your name';}
                        else {
                          return null;
                        }
                        },
                        controller: nameController,
                        prefixIcon: Icons.supervised_user_circle,
                        textInputAction: TextInputAction.next,
                        label: 'User name',
                        hint: 'name',
                      ),
                    ),
                    const SizedBox(height : 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration : BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color : Colors.grey[200]!)
                        ),
                      ),
                      child: defaultTextFormField(
                        isPassword: false,
                        keyBoardType: TextInputType.emailAddress,
                        validate: (value){  if(value!.isEmpty){return 'Empty Field , please enter your email';}
                        else if(!value.contains('@')){ return 'Invalid Email , please Enter a valid email';}
                        else if(!value.contains('.')){ return 'Invalid Email , please Enter a valid email';}
                        else {
                          return null;
                        }
                        },
                        controller: emailController,
                        prefixIcon: Icons.alternate_email,
                        textInputAction: TextInputAction.next,
                        label: 'Patient E-mail',
                        hint: 'PatientMail@bluemedical.cl',
                      ),
                    ),
                    const SizedBox(height : 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration : BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color : Colors.grey[200]!)
                        ),
                      ),
                      child: defaultTextFormField(
                        keyBoardType: TextInputType.name,
                        validate: (value){  if(value!.isEmpty){return 'Empty Field , please enter your phone number';}
                        else {
                          return null;
                        }
                        },
                        controller: phoneController,
                        prefixIcon: Icons.phone,
                        textInputAction: TextInputAction.next,
                        label: 'User phone number',
                        hint: '0999999999', isPassword: false,
                      ),
                    ),
                    const SizedBox(height : 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration : BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color : Colors.grey[200]!)
                        ),
                      ),
                      child: defaultTextFormField(
                        textInputAction: TextInputAction.next,
                        isPassword: cubit.showPassword,
                        keyBoardType: TextInputType.visiblePassword,
                        validate: (value){  if(value!.isEmpty){return 'Empty Field , please enter your password';}
                        else if(value.length < 6){ return 'Too short, password should be more than 6 ';}
                        else if(value.length > 16){ return 'Too long, password should be less than 6 ';}
                        else {
                          return null;
                        }
                        },
                        controller: passwordController,
                        prefixIcon: Icons.lock,
                        suffixIcon: cubit.suffixIcon,
                        suffixIconFun: (){
                          cubit.changePasswordVisibility();
                        },
                        label: 'Patient Password',
                        hint: '********',
                      ),
                    ),
                    const SizedBox(height : 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration : BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color : Colors.grey[200]!)
                        ),
                      ),
                      child: defaultTextFormField(
                        isPassword: cubit.showConfirmPassword,
                        keyBoardType: TextInputType.visiblePassword,
                        validate: (value){  if(value!.isEmpty){return 'Empty Field , please enter your password';}
                        else if(value.length < 6){ return 'Too short, password should be more than 6 ';}
                        else if(value.length > 16){ return 'Too long, password should be less than 6 ';}
                        else {
                          return null;
                        }
                        },
                        controller: confirmController,
                        prefixIcon: Icons.lock,
                        suffixIcon: cubit.suffixConfirmIcon,
                        suffixIconFun: (){
                          cubit.changePasswordConfirmVisibility();
                        },
                        textInputAction: TextInputAction.done,
                        label: 'Confirm Password',
                        hint: '********',
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ConditionalBuilder(
                        condition: state is! PatientRegisterLoadingState,
                        builder: (context) => defaultMaterialButton(
                            buttonText: 'Register',
                            function: () {
                              if(formKey.currentState!.validate()){
                                cubit.patientRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text
                                );
                               // navigateAndFinish(const PatientHomeScreen(), context);
                              }
                            }),
                        fallback: (context) => SpinKitWave(
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
          },
      ),
    );
  }
}

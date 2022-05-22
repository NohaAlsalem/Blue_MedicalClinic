// import 'package:blue_medical_clinic/modules/patient_screens/login_screen/input_files/input_field.dart';
// import 'package:blue_medical_clinic/shared/components/components.dart';
// import 'package:flutter/material.dart';
// class InputWrapper extends StatelessWidget {
//    InputWrapper({Key? key}) : super(key: key);
//    var emailController    = TextEditingController();
//    var passwordController = TextEditingController();
//    var formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Form(
//         key : formKey,
//         child: Padding(
//             padding: const EdgeInsets.all(20),
//           child: Column(
//             children:<Widget>[
//               const SizedBox(height : 40),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child : Column(
//                   children: <Widget>[
//                     Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration : BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(color : Colors.grey[200]!)
//                         ),
//                       ),
//                       child: defaultTextFormField(
//                         isPassword: false,
//                         keyBoardType: TextInputType.emailAddress,
//                         validate: (value){  if(value!.isEmpty){return 'Empty Field , please enter your email';}
//                         else if(!value.contains('@gmail.com')){ return 'Invalid Email , please Enter a valid email';}
//                         else {
//                           return null;
//                         }
//                         },
//                         controller: emailController,
//                         prefixIcon: Icons.alternate_email,
//                         textInputAction: TextInputAction.next,
//                         label: 'Patient E-mail',
//                         hint: 'PatientMail@gmail.com',
//                       ),
//                     ),
//                     const SizedBox(height : 20),
//                     Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration : BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(color : Colors.grey[200]!)
//                         ),
//                       ),
//                       child: defaultTextFormField(
//                         isPassword: true,
//                         keyBoardType: TextInputType.visiblePassword,
//                         validate: (value){  if(value!.isEmpty){return 'Empty Field , please enter your password';}
//                         else if(value.length < 6){ return 'Too short, password should be more than 6 ';}
//                         else if(value.length > 16){ return 'Too long, password should be less than 6 ';}
//                         else {
//                           return null;
//                         }
//                         },
//                         controller: passwordController,
//                         prefixIcon: Icons.lock,
//                         suffixIcon: Icons.visibility,
//                         suffixIconFun: (){},
//                         textInputAction: TextInputAction.next,
//                         label: 'Patient Password',
//                         hint: '********',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 40,),
//              defaultMaterialButton(
//                  buttonText: 'LOGIN',
//                  function: () {
//                    if(formKey.currentState!.validate()){}
//                  })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

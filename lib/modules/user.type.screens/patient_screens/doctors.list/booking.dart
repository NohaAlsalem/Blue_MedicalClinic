import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/cubit/state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../shared/components/components.dart';


class Booking extends StatelessWidget {
  Booking({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  String message='No entry';


  TextEditingController nameInput     = TextEditingController();
  TextEditingController ageInput      = TextEditingController();
  TextEditingController idInput       = TextEditingController();
  TextEditingController phoneInput    = TextEditingController();
  TextEditingController diseasesInput = TextEditingController();


  List<DropdownMenuItem<String>> get dropdownItemsGender{
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(child: Text("Male"),value: "Male"),
      DropdownMenuItem(child: Text("Female"),value: "Female"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (BuildContext context) => CounterCubit()..appointment(context)..start..end,
      child: BlocConsumer<CounterCubit ,TimeStates >(
          listener: (context , state)
          {
            // if( state is InitialTimeState)
            //     {print('initial');}
            // if( state is CounterXTimeState)
            // {print('initial counter${state.x}');}
            //
            // if( state is StartTimeHourState)
            // {print(' st hour${state.startH}');}
            //
            // if( state is StartTimeMinuteState)
            // {print(' st minute${state.startM}');}
            //
            // if( state is NameState)
            // {print(' name ${state.name}');}
            //
            // if( state is AgeState)
            // {print(' age ${state.age}');}
            //
            // if( state is IdState)
            // {print(' id ${state.id}');}
            //
            // if( state is PhoneState)
            // {print(' phone ${state.phone}');}
            //
            // if( state is SuccessState)
            // {print(' success${state.toString()}');}
            //
            // if( state is FailedState)
            // {print(' success${state.error}');}
          },
          builder : (context , state)
          {
            return  Scaffold(
              body:Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xAA93f0fc),
                          Color(0xAAf3e5f5),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children:[
                        Stack(
                          children: [
                            Container(
                              height: 180.0,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.indigo,
                                    Color(0xAA1a76b5),
                                    Color(0xFF9696C8),
                                  ],
                                ),
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.elliptical(
                                      MediaQuery.of(context).size.width, 60.0 ),
                                ),
                              ),
                            ),
                            Container(
                              height: 180.0,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.elliptical(
                                        MediaQuery.of(context).size.width, 100.0)),
                                image: const DecorationImage(
                                  image:  AssetImage('assets/images/booking.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children:const[
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                              ),
                              child: Text('Patient Information' , style: TextStyle(
                                fontSize: 23.0,
                                color:  Color(0xFF0876D4),
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Allison',
                              ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15.0,
                                left: 20.0,
                                right: 20.0,
                              ),
                              child: Material(
                                color: Colors.white,
                                shadowColor: const Color(0xFF326fa5),
                                elevation: 20,
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  padding: const EdgeInsets.all(19.0),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                    ),
                                  ),
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children : [
                                          Row(
                                            children: const  [
                                              Text('*', style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: Colors.red,
                                              ),),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('Name', style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                              ),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: nameInput ,
                                                  keyboardType: TextInputType.text,
                                                  validator:(value) {
                                                    if(value!.isEmpty) {
                                                      return 'name must not be empty ';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Row(
                                            children: const  [
                                              Text('*' , style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: Colors.red,
                                              ),),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('Age' , style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                              ),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: ageInput ,
                                                  keyboardType: TextInputType.number,
                                                  validator:(value) {
                                                    if(value!.isEmpty) {
                                                      return 'Age must not be empty ';
                                                    }
                                                    if (value.contains("[a-zA-Z]+") != false) {
                                                      return 'Age must not have a letters';
                                                    }
                                                    else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Row(
                                            children: const[
                                              Text('*' , style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: Colors.red,
                                              ),),
                                              SizedBox(
                                                width: 10,
                                              ),

                                              Text('Phone Number' , style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                              ),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                    controller: phoneInput ,
                                                    keyboardType: TextInputType.number,
                                                    decoration: const InputDecoration(
                                                    ),
                                                    validator:(value) {
                                                      if (value!.isEmpty) {
                                                        return 'phone must not be empty ';
                                                      }
                                                      if (value.length != 10) {
                                                        return 'Mobile Number must be of 10 digit';
                                                      }
                                                      if (value.contains("[a-zA-Z]+") != false) {
                                                        return 'Mobile Number must not have a letters';
                                                      }
                                                      if (!value.startsWith('09')) {
                                                        return 'Input with 09';
                                                      }
                                                      else {
                                                        return null;
                                                      }
                                                    }
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Row(
                                            children: const[
                                              Text('*' , style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: Colors.red,
                                              ),),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('Gender' , style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                              ),),
                                            ],
                                          ),
                                          DropdownButtonFormField(
                                              dropdownColor: Colors.white,
                                              value: CounterCubit.get(context).selectedValueGender,
                                              onChanged: (String? newValue) {
                                                CounterCubit.get(context).selectedValueGender='$newValue';
                                              },
                                              items: dropdownItemsGender
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Row(
                                            children: const[
                                              Text('Did you have any chronic diseases ?' , style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                              ),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: diseasesInput ,
                                                  validator:(value) {
                                                    // if (value!.contains("[0-9]") == false) {
                                                    //   return 'Write a letters / the number not accept';
                                                    // }
                                                    if(value!.isEmpty) {
                                                      return 'This Field must not empty, if you Don\'t have say it';
                                                    }
                                                    else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xAA1a76b5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              print(DateFormat.yMMMd().format(theDate as DateTime));
                              if (formKey.currentState!.validate()) {
                                CounterCubit.get(context).appointment(context);
                                CounterCubit.get(context).addData(
                                    nameInput.text,
                                    ageInput.text,
                                    phoneInput.text,
                                    DateFormat.yMMMd().format(theDate as DateTime),
                                    CounterCubit.get(context).selectedValueGender,
                                    diseasesInput.text,
                                    daySelected.toString(),
                                    doctorSelected.toString(),
                                    context);
                              }
                            },
                            child: const Text(
                              'Booking now', style: TextStyle(
                              color: Colors.white,
                            ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}


String? daySelected;
String? doctorSelected;

void day(currentDay)
{
  daySelected = currentDay;
}

void doctorN(currentDoctorName)
{
  doctorSelected = currentDoctorName;
}







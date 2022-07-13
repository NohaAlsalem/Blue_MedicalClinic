import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/cubit/state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Booking extends StatelessWidget {


  Booking({Key? key}) : super(key: key);
  var formkey = GlobalKey<FormState>();


  TextEditingController nameInput  = TextEditingController();
  TextEditingController ageInput   = TextEditingController();
  TextEditingController idInput    = TextEditingController();
  TextEditingController phoneInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit ,TimeStates >(
          listener: (context , state)
          {

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
                                  image:  AssetImage('assets/booking.jpg'),
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
                                // color: Color(0xFF01203b),
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
                                    key: formkey,
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children : [
                                          const Text('Name', style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),),
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
                                            height: 25.0,
                                          ),
                                          const Text('Age' , style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: ageInput ,
                                                  keyboardType: TextInputType.number,
                                                  validator:(value) {
                                                    if(value!.isEmpty) {
                                                      return 'age must not be empty ';
                                                    }else if(!value.contains("[a-zA-Z]")){
                                                      return 'phone must not have characters';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 25.0,
                                          ),
                                          const Text('National ID' , style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: idInput ,
                                                  keyboardType: TextInputType.number,
                                                  validator:(value) {
                                                    if(value!.isEmpty) {
                                                      return 'ID must not be empty ';
                                                    }else if(!value.contains("[a-zA-Z]")){
                                                      return 'phone must not have characters';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 25.0,
                                          ),
                                          const Text('Phone Number' , style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: phoneInput ,
                                                  keyboardType: TextInputType.number,
                                                  decoration: const InputDecoration(
                                                  ),
                                                  validator:(value) {
                                                    if(value!.isEmpty) {
                                                      return 'phone must not be empty ';
                                                    }else if(!value.contains("[a-zA-Z]")){
                                                      return 'phone must not have characters';
                                                    }
                                                    return null;
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
                              print(daySelected.toString());
                              if (formkey.currentState!.validate()) {
                                CounterCubit.get(context).appointment(context);
                                CounterCubit.get(context).addData(
                                    nameInput.text,
                                    ageInput.text,
                                    idInput.text,
                                    phoneInput.text,
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







import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/cubit/state.dart';
import 'package:blue_medical_clinic/modules/user.type.screens/patient_screens/doctors.list/cubit/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<TimeStates> {
  CounterCubit() : super(InitialTimeState());

  static CounterCubit get(context) => BlocProvider.of(context);

 // var selectedValueGender;
  var selectedValueGender = 'Male';



  Time start = Time(12, 30);
  Time end = Time(15, 00);
  int x = 0;

  void appointment(context) {
    if (start.hour != end.hour || start.minute != end.minute) {
      start.minute = start.minute + 30;
      if (start.minute == 60) {
        start.hour++;
        start.minute = 00;
      }
      emit(StartTimeHourState(start.hour));
      emit(StartTimeMinuteState(start.minute));
      emit(EndTimeHourState(end.hour));
      emit(EndTimeMinuteState(end.minute));
    }
    if (start.hour == end.hour) {
       AwesomeDialog(
          context: context,
          body: Column(
            children: [
              const Text('There is no reservation today', style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),),
              TextButton(
                child: const Text('Done'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'home');
                },
              ),
            ],
          )
      ).show()
       .catchError((error) {
        emit(ErrorTimeState(error.toString()));
      });
    }
  }



  Future<void> addData(  nameInput, ageInput, phoneInput,theDate, selectedValueGender ,diseasesInput, daySelected,doctorSelected, context) async {
    {

      if (daySelected.toString() == 'Monday') {
      UserModel model = UserModel(
          name: nameInput,
          age: ageInput,
          phone: phoneInput,
          gender:selectedValueGender,
         disease:diseasesInput,
        date: theDate,
        hour: CounterCubit
              .get(context)
              .start
              .hour,
          minute: CounterCubit
              .get(context)
              .start
              .minute,
          doctorSelected:doctorSelected,
      );
      FirebaseFirestore.instance.collection('appointment').doc('Monday').collection('Reservations').doc().set(model.toMap(context))
          .then((value) {
        print('success');
          emit(SuccessState());
            AwesomeDialog(
                context: context,
                dialogType: DialogType.SUCCES,
                body: Column(
                  children: [
                    const Text('Booking confirmed', style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      // color: Color(0xFF01203b),
                    ),),
                    TextButton(
                      child: const Text('Done'),
                      onPressed: () {
                        emit(StartTimeHourState(start.hour));
                        emit(StartTimeMinuteState(start.minute));
                        emit(EndTimeHourState(end.hour));
                        emit(EndTimeMinuteState(end.minute));
                        Navigator.pushReplacementNamed(context, 'home');
                      },
                    ),
                  ],
                )
            ).show();
      }).catchError((error){
        emit(FailedState(error.toString()));
        print('error in app , error is ${error.toString()}');
        });
    }
      if (daySelected.toString() == 'Tuesday') {
        UserModel model = UserModel(
          name: nameInput,
          age: ageInput,
          phone: phoneInput,
          gender:selectedValueGender,
          disease:diseasesInput,
          date: theDate,
          hour: CounterCubit
              .get(context)
              .start
              .hour,
          minute: CounterCubit
              .get(context)
              .start
              .minute,
          doctorSelected:doctorSelected,
        );
        FirebaseFirestore.instance.collection('appointment').doc('Tuesday').collection('Reservations').doc().set(model.toMap(context))
            .then((value) {
          emit(SuccessState());
          AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              body: Column(
                children: [
                  const Text('Booking confirmed', style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    // color: Color(0xFF01203b),
                  ),),
                  TextButton(
                    child: const Text('Done'),
                    onPressed: () {
                      emit(StartTimeHourState(start.hour));
                      emit(StartTimeMinuteState(start.minute));
                      emit(EndTimeHourState(end.hour));
                      emit(EndTimeMinuteState(end.minute));
                      Navigator.pushReplacementNamed(context, 'home');
                    },
                  ),
                ],
              )
          )
              .show();
        }).catchError((error){
          emit(FailedState(error.toString()));
        });
      }else{
        UserModel model = UserModel(
          name: nameInput,
          age: ageInput,
          phone: phoneInput,
          gender:selectedValueGender,
          disease:diseasesInput,
          date: theDate,
          hour: CounterCubit
              .get(context)
              .start
              .hour,
          minute: CounterCubit
              .get(context)
              .start
              .minute,
          doctorSelected:doctorSelected,
        );
        FirebaseFirestore.instance.collection('appointment').doc('Wednesday').collection('Reservations').doc().set(model.toMap(context))
            .then((value) {
          emit(SuccessState());
          AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              body: Column(
                children: [
                  const Text('Booking confirmed', style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    // color: Color(0xFF01203b),
                  ),),
                  TextButton(
                    child: const Text('Done'),
                    onPressed: () {
                      emit(StartTimeHourState(start.hour));
                      emit(StartTimeMinuteState(start.minute));
                      emit(EndTimeHourState(end.hour));
                      emit(EndTimeMinuteState(end.minute));
                      Navigator.pushReplacementNamed(context, 'home');
                    },
                  ),
                ],
              )
          )
              .show();
        }).catchError((error){
          emit(FailedState(error.toString()));
        });
      }
    }
  }

  // CollectionReference collectionRef = FirebaseFirestore.instance.collection('Section').doc('Doctors').collection('Neurological');
  //  List doctors=[];
  //
  //  getDocs() async {
  //  var res =  await collectionRef.get();
  //     res.docs.forEach((element){
  //        doctors.add(element.data());
  //        emit(FetchDataState());
  //         });
  //      // print(doctors);
  // }

  // gastroenterology(docRefGastroenterology)
  // {
  //   int x;
  //   emit(PatientHomeGastroenterology(docRefGastroenterology));
  // }

}
class Time {
  var hour;
  var minute;

  Time(this.hour, this.minute);

}



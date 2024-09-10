import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:blue_medical_clinic/models/Patient_BookingModel/user_model.dart';
import 'package:blue_medical_clinic/modules/patien_part/Booking/booking.dart';
import 'package:blue_medical_clinic/modules/patien_part/cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<TimeStates> {
  CounterCubit() : super(InitialTimeState());

  static CounterCubit get(context) => BlocProvider.of(context);

  // var selectedValueGender;
  var selectedValueGender = 'Male';

  DateTime? theDate;
  datePickerMond(BuildContext context){
    showDatePicker( context: context,
      initialDate:DateTime.utc(2022,8,15),
      firstDate:DateTime.now(),
      lastDate: DateTime.utc(2024,1,1),
      selectableDayPredicate: (date) {
        if (date.weekday==DateTime.sunday ||
            date.weekday== DateTime.friday||
            date.weekday==DateTime.saturday ||
            date.weekday==DateTime.thursday||
            date.weekday==DateTime.wednesday||
            date.weekday==DateTime.tuesday
        )
          //Disable weekend days to select from the calendar
            {
          return false;
        }
        return true;
      },
    ).then((value){
      theDate=value;
      if(value==null){return;}
    });
    print(theDate);
    //
  }
  datePickerMonday(BuildContext context){
    showDatePicker( context: context,
      initialDate:DateTime.utc(2022,8,15),
      firstDate:DateTime.now(),
      lastDate: DateTime.utc(2024,1,1),
      selectableDayPredicate: (date) {
        if (date.weekday==DateTime.sunday ||
            date.weekday== DateTime.friday||
            date.weekday==DateTime.saturday ||
            date.weekday==DateTime.thursday||
            date.weekday==DateTime.wednesday||
            date.weekday==DateTime.tuesday
        )
          //Disable weekend days to select from the calendar
            {
          return false;
        }
        return true;
      },
    ).then((value)async{
      theDate= await value;
      Navigator.of(context).pushNamed('booking',);
      //if(value==null){return;}
    });
    print(theDate);
    //
  }
  datePickerTuesday(BuildContext context){
    showDatePicker( context: context,
      initialDate:DateTime.utc(2022,8,16),
      firstDate:DateTime.now(),
      lastDate: DateTime.utc(2024,1,1),
      selectableDayPredicate: (date) {
        if (date.weekday==DateTime.sunday ||
            date.weekday== DateTime.friday||
            date.weekday==DateTime.saturday ||
            date.weekday==DateTime.monday||
            date.weekday==DateTime.wednesday||
            date.weekday==DateTime.thursday
        )
          //Disable weekend days to select from the calendar
            {
          return false;
        }
        //if (date.weekday==DateTime.monday || date.weekday == DateTime.tuesday||date.weekday==DateTime.wednesday ){}
        // return true;
        return true;
      },
    ).then((value)async{
      theDate=await value;
      //emit(SuccessDate(theDate!));
      //Navigator.of(context).pushNamed('booking',);

      // if(value==null){return;}
    }).catchError((eroro){
      print('error in data time , error is , : ${eroro.toString()}');
    });
    print(theDate);
  }
  datePickerWednesday(BuildContext context){
    showDatePicker( context: context,
      initialDate:DateTime.utc(2022,8,17),
      firstDate:DateTime.now(),
      lastDate: DateTime.utc(2024,1,1),
      selectableDayPredicate: (date) {
        if (date.weekday==DateTime.sunday ||
            date.weekday== DateTime.friday||
            date.weekday==DateTime.saturday ||
            date.weekday==DateTime.monday||
            date.weekday==DateTime.thursday||
            date.weekday==DateTime.tuesday
        )
          //Disable weekend days to select from the calendar
            {
          return false;
        }
        //if (date.weekday==DateTime.monday || date.weekday == DateTime.tuesday||date.weekday==DateTime.wednesday ){}
        // return true;
        return true;
      },
    ).then((value){
      theDate=value;
      Navigator.of(context).pushNamed('booking',);
      // if(value==null){return;}
    });
    print(theDate);
  }


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
              const Text(
                'There is no reservation today',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                child: const Text('Done'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'home');
                },
              ),
            ],
          )).show().catchError((error) {
        emit(ErrorTimeState(error.toString()));
      });
    }
  }
  Future<void> addData(
     String nameInput,
      ageInput,
      phoneInput,
      theDate,
      selectedValueGender,
      diseasesInput,
      daySelected,
      doctorSelected,
      context) async {
    {
      if (daySelected.toString() == 'Monday') {
        UserModel model = UserModel(
          date: theDate,
          name: nameInput,
          age: ageInput,
          phone: phoneInput,
          gender: selectedValueGender,
          disease: diseasesInput,
          hour: CounterCubit.get(context).start.hour,
          minute: CounterCubit.get(context).start.minute,
          doctorSelected: doctorSelected,
          daySelected: daySelected,
        );
        FirebaseFirestore.instance
            .collection('appointment')
            .doc('Monday')
            .collection('Reservations')
            .doc()
            .set(model.toMap(context))
            .then((value) {
          print('success');
          emit(SuccessState());
          AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              body: Column(
                children: [
                  const Text(
                    'Booking confirmed',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      // color: Color(0xFF01203b),
                    ),
                  ),
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
              )).show();
        }).catchError((error) {
          emit(FailedState(error.toString()));
          print('error in app , error is ${error.toString()}');
        });
      }
      if (daySelected.toString() == 'Tuesday') {
        UserModel model = UserModel(
          name: nameInput,
          age: ageInput,
          phone: phoneInput,
          gender: selectedValueGender,
          disease: diseasesInput,
          date: theDate,
          hour: CounterCubit.get(context).start.hour,
          minute: CounterCubit.get(context).start.minute,
          doctorSelected: doctorSelected,
          daySelected: daySelected,
        );
        FirebaseFirestore.instance
            .collection('appointment')
            .doc('Tuesday')
            .collection('Reservations')
            .doc(nameInput)
            .set(model.toMap(context))
            .then((value) {
          emit(SuccessState());
          AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              body: Column(
                children: [
                  const Text(
                    'Booking confirmed',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      // color: Color(0xFF01203b),
                    ),
                  ),
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
              )).show();
        }).catchError((error) {
          emit(FailedState(error.toString()));
        });
      }
      if (daySelected.toString() == 'Wednesday') {
        UserModel model = UserModel(
          name: nameInput,
          age: ageInput,
          phone: phoneInput,
          gender: selectedValueGender,
          disease: diseasesInput,
          date: theDate,
          hour: CounterCubit.get(context).start.hour,
          minute: CounterCubit.get(context).start.minute,
          doctorSelected: doctorSelected,
          daySelected: daySelected,
        );
        FirebaseFirestore.instance
            .collection('appointment')
            .doc('Wednesday')
            .collection('Reservations')
            .doc()
            .set(model.toMap(context))
            .then((value) {
          emit(SuccessState());
          AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              body: Column(
                children: [
                  const Text(
                    'Booking confirmed',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      // color: Color(0xFF01203b),
                    ),
                  ),
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
              )).show();
        }).catchError((error) {
          emit(FailedState(error.toString()));
        });
      }
    }
  }
  Future<void> deletDate(i)async{
    if(daySelected.toString()=='Monday'){
     await FirebaseFirestore.instance
          .collection('appointment')
          .doc('Monday')
          .collection('Reservations')
          .doc().delete();
    }
    if(daySelected.toString()=='Tuesday'){
      await FirebaseFirestore.instance
          .collection('appointment')
          .doc('Tuesday')
          .collection('Reservations')
          .doc().delete();
    }
    if(daySelected.toString()=='Wednesday'){
      await FirebaseFirestore.instance
          .collection('appointment')
          .doc('Wednesday')
          .collection('Reservations')
          .doc().delete();
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

  Future<void> deletData(List t) async {
    {
      if (daySelected.toString() == 'Monday') {
        await FirebaseFirestore.instance
            .collection('appointment')
            .doc('Monday')
            .collection('Reservations')
            .doc("${t}").delete();
         print('delete');
            //.set(model.toMap(context));
        //return await revers.doc().delete();
      }
      if (daySelected.toString() == 'Tuesday') {
        await FirebaseFirestore.instance
            .collection('appointment')
            .doc('Tuesday')
            .collection('Reservations')
            .doc("${t}").delete();
        print('delete');
           // .set(model.toMap(context));
       // return await doc.delete();
      }
      if (daySelected.toString() == 'Wednesday') {
       await FirebaseFirestore.instance
            .collection('appointment')
            .doc('Wednesday')
            .collection('Reservations')
            .doc("${t}").delete();
        print('delete');
           // .set(model.toMap(context));
       // return await doc.delete();
      }
    }}

         // emit(deleteState());
          // AwesomeDialog(
          //     context: context,
          //     dialogType: DialogType.SUCCES,
          //     body: Column(
          //       children: [
          //         const Text(
          //           'Booking confirmed',
          //           style: TextStyle(
          //             fontSize: 14.0,
          //             fontWeight: FontWeight.bold,
          //             // color: Color(0xFF01203b),
          //           ),
          //         ),
          //         TextButton(
          //           child: const Text('Done'),
          //           onPressed: () {
          //             emit(StartTimeHourState(start.hour));
          //             emit(StartTimeMinuteState(start.minute));
          //             emit(EndTimeHourState(end.hour));
          //             emit(EndTimeMinuteState(end.minute));
          //             Navigator.pushReplacementNamed(context, 'home');



}

class Time {
  var hour;
  var minute;

  Time(this.hour, this.minute);
}

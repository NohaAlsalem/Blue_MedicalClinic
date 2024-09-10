import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:blue_medical_clinic/modules/doctor_part/home_layout_doc/home_screen.dart';
import 'package:blue_medical_clinic/models/Patient_model_toreport/patientmodel.dart';
import 'package:blue_medical_clinic/modules/doctor_part/reports/write_report/cubit/satats.dart';
import 'package:blue_medical_clinic/shared/components/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../paitent_records.dart';


class PatientReport extends Cubit<StatestoReport>{

  PatientReport():super (InitialState());

  static PatientReport get(context)=>BlocProvider.of(context);

  Future<void> addDataPatient( doctorSelected , nameInput, ageInput,theDate, gender ,hour ,minute ,disease ,diagnosis ,report, imageReport,imageRadiographic,imageMedicalTests ,context) async
  {
    if(doctorSelected.toString() =='DR.Amal'){
      PatientModel model = PatientModel(
        name: nameInput,
        age: ageInput,
        gender:gender,
        date:theDate,
        hour: hour,
        minute: minute,
        disease:disease,
        diagnosis:diagnosis,
        report: report,
        imageReport: imageReport,
        imageRadiographic:imageRadiographic ,
        imageMedicalTests: imageMedicalTests ,

      );
      FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Amal').doc().set(model.toMap(context))
          .then((value) {
        emit(SuccessStates());
      }).catchError((error) {
      });
      AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          body: Column(
            children: const [
              Text('It\'s Done', style: TextStyle(
                fontSize: 16.0,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                // color: Color(0xFF01203b),
              ),),
              SizedBox(height: 20,)
            ],
          )
      ).show();    }
    if(doctorSelected.toString() =='DR.Musallam'){
      PatientModel model = PatientModel(
        name: nameInput,
        age: ageInput,
        gender:gender,
        date:theDate,
        hour: hour,
        minute: minute,
        disease:disease,
        diagnosis:diagnosis,
        report: report,
        imageReport: imageReport,
        imageRadiographic:imageRadiographic ,
        imageMedicalTests: imageMedicalTests ,
      );
      FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Musallam').doc().set(model.toMap(context))
          .then((value) {
        emit(SuccessStates());
      }).catchError((error) {
      });
      AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          body: Column(
            children: const [
              Text('It\'s Done', style: TextStyle(
                fontSize: 16.0,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                // color: Color(0xFF01203b),
              ),),
              SizedBox(height: 20,)
            ],
          )
      ).show();
    }
    if(doctorSelected.toString() =='DR.Ahmad'){
      PatientModel model = PatientModel(
        name: nameInput,
        age: ageInput,
        gender:gender,
        date:theDate,
        hour: hour,
        minute: minute,
        disease:disease,
        diagnosis:diagnosis,
        report: report,
        imageReport: imageReport,
        imageRadiographic:imageRadiographic ,
        imageMedicalTests: imageMedicalTests ,
      );
      FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Ahmad').doc().set(model.toMap(context))
          .then((value) {
        emit(SuccessStates());
      }).catchError((error) {
      });
      AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          body: Column(
            children: const [
              Text('It\'s Done', style: TextStyle(
                fontSize: 16.0,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                // color: Color(0xFF01203b),
              ),),
              SizedBox(height: 20,)
            ],
          )
      ).show();    }
    if(doctorSelected.toString() =='DR.Hassan'){
      PatientModel model = PatientModel(
        name: nameInput,
        age: ageInput,
        gender:gender,
        date:theDate,
        hour: hour,
        minute: minute,
        disease:disease,
        diagnosis:diagnosis,
        report: report,
        imageReport: imageReport,
        imageRadiographic:imageRadiographic ,
        imageMedicalTests: imageMedicalTests ,
      );
      FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Hasan').doc().set(model.toMap(context))
          .then((value) {
        emit(SuccessStates());
      }).catchError((error) {
      });
      AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          body: Column(
            children: const [
              Text('It\'s Done', style: TextStyle(
                fontSize: 16.0,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                // color: Color(0xFF01203b),
              ),),
              SizedBox(height: 20,)
            ],
          )
      ).show();    }
    if(doctorSelected.toString() =='DR.Fahad'){
      PatientModel model = PatientModel(
        name: nameInput,
        age: ageInput,
        gender:gender,
        date:theDate,
        hour: hour,
        minute: minute,
        disease:disease,
        diagnosis:diagnosis,
        report: report,
        imageReport: imageReport,
        imageRadiographic:imageRadiographic ,
        imageMedicalTests: imageMedicalTests ,
      );
      FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Fahad').doc().set(model.toMap(context))
          .then((value) {
        emit(SuccessStates());
      }).catchError((error) {
      });
      AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          body: Column(
            children: const [
              Text('It\'s Done', style: TextStyle(
                fontSize: 16.0,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                // color: Color(0xFF01203b),
              ),),
              SizedBox(height: 20,)
            ],
          )
      ).show();
    }
    if(doctorSelected.toString() =='DR.Ali'){
      PatientModel model = PatientModel(
        name: nameInput,
        age: ageInput,
        gender:gender,
        date:theDate,
        hour: hour,
        minute: minute,
        disease:disease,
        diagnosis:diagnosis,
        report: report,
        imageReport: imageReport,
        imageRadiographic:imageRadiographic ,
        imageMedicalTests: imageMedicalTests ,
      );
      FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Ali').doc().set(model.toMap(context))
          .then((value) {
        emit(SuccessStates());
      }).catchError((error) {
      });
      AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          body: Column(
            children: const [
              Text('It\'s Done', style: TextStyle(
                fontSize: 16.0,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                // color: Color(0xFF01203b),
              ),),
              SizedBox(height: 20,)
            ],
          )
      ).show();    }
    if(doctorSelected.toString() =='DR.Nedal'){
      PatientModel model = PatientModel(
        name: nameInput,
        age: ageInput,
        gender:gender,
        date:theDate,
        hour: hour,
        minute: minute,
        disease:disease,
        diagnosis:diagnosis,
        report: report,
        imageReport: imageReport,
        imageRadiographic:imageRadiographic ,
        imageMedicalTests: imageMedicalTests ,
      );
      FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Nedal').doc().set(model.toMap(context))
          .then((value) {
        emit(SuccessStates());
      }).catchError((error) {
      });
      AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          body: Column(
            children: const [
              Text('It\'s Done', style: TextStyle(
                fontSize: 16.0,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                // color: Color(0xFF01203b),
              ),),
              SizedBox(height: 20,)
            ],
          )
      ).show();    }
    if(doctorSelected.toString() =='DR.Mohammad K'){
      PatientModel model = PatientModel(
        name: nameInput,
        age: ageInput,
        gender:gender,
        date:theDate,
        hour: hour,
        minute: minute,
        disease:disease,
        diagnosis:diagnosis,
        report: report,
        imageReport: imageReport,
        imageRadiographic:imageRadiographic ,
        imageMedicalTests: imageMedicalTests ,
      );
      FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Mohammad k').doc().set(model.toMap(context))
          .then((value) {
        emit(SuccessStates());
      }).catchError((error) {
      });
      AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          body: Column(
            children: const [
              Text('It\'s Done', style: TextStyle(
                fontSize: 16.0,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                // color: Color(0xFF01203b),
              ),),
              SizedBox(height: 20,)
            ],
          )
      ).show();
      // navigateTo(PatientRecord(), context);
    }
    if(doctorSelected.toString() =='DR.Mohammad'){
      PatientModel model = PatientModel(
        name: nameInput,
        age: ageInput,
        gender:gender,
        date:theDate,
        hour: hour,
        minute: minute,
        disease:disease,
        diagnosis:diagnosis,
        report: report,
        imageReport: imageReport,
        imageRadiographic:imageRadiographic ,
        imageMedicalTests: imageMedicalTests ,
      );
      FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Mohammad').doc().set(model.toMap(context))
          .then((value) {
        emit(SuccessStates());
      }).catchError((error) {
      });
      AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          body: Column(
            children: const [
              Text('It\'s Done', style: TextStyle(
                fontSize: 16.0,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                // color: Color(0xFF01203b),
              ),),
              SizedBox(height: 20,)
            ],
          )
      ).show();
    }
    if(doctorSelected.toString() =='DR.Naser'){
      PatientModel model = PatientModel(
        name: nameInput,
        age: ageInput,
        gender:gender,
        date:theDate,
        hour: hour,
        minute: minute,
        disease:disease,
        diagnosis:diagnosis,
        report: report,
        imageReport: imageReport,
        imageRadiographic:imageRadiographic ,
        imageMedicalTests: imageMedicalTests ,
      );
      FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Naser').doc().set(model.toMap(context))
          .then((value) {
        emit(SuccessStates());
      }).catchError((error) {
      });
      AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          body: Column(
            children: const [
              Text('It\'s Done', style: TextStyle(
                fontSize: 16.0,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                // color: Color(0xFF01203b),
              ),),
              SizedBox(height: 20,)
            ],
          )
      ).show();
    }
  }

  var info =[];
  var name_doc;
  getDataMusallam(context) async {
    CollectionReference appMusallamM = FirebaseFirestore.instance.collection('appointment').doc('Monday').collection('Reservations');
    CollectionReference appMusallamT = FirebaseFirestore.instance.collection('appointment').doc('Tuesday').collection('Reservations');
    CollectionReference appMusallamW = FirebaseFirestore.instance.collection('appointment').doc('Wednesday').collection('Reservations');

    await appMusallamM.where('doctorSelected', isEqualTo: 'DR.Musallam').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appMusallamT.where('doctorSelected', isEqualTo: 'DR.Musallam').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appMusallamW.where('doctorSelected', isEqualTo: 'DR.Musallam').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });

    navigateTo(DoctorHome(info), context);
  }
  getDataAli(context) async {
    CollectionReference appAliM = FirebaseFirestore.instance.collection('appointment').doc('Monday').collection('Reservations');
    CollectionReference appAliT = FirebaseFirestore.instance.collection('appointment').doc('Tuesday').collection('Reservations');
    CollectionReference appAliW = FirebaseFirestore.instance.collection('appointment').doc('Wednesday').collection('Reservations');

    await appAliM.where('doctorSelected', isEqualTo: 'DR.Ali').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));

      }
    });
    await appAliT.where('doctorSelected', isEqualTo: 'DR.Ali').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));

      }
    });
    await appAliW.where('doctorSelected', isEqualTo: 'DR.Ali').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    navigateTo(DoctorHome(info), context);
  }
  getDataNedal(context) async {
    CollectionReference appNedalM = FirebaseFirestore.instance.collection('appointment').doc('Monday').collection('Reservations');
    CollectionReference appNedalT = FirebaseFirestore.instance.collection('appointment').doc('Tuesday').collection('Reservations');
    CollectionReference appNedalW = FirebaseFirestore.instance.collection('appointment').doc('Wednesday').collection('Reservations');

    await appNedalM.where('doctorSelected', isEqualTo: 'DR.Nedal').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appNedalT.where('doctorSelected', isEqualTo: 'DR.Nedal').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appNedalW.where('doctorSelected', isEqualTo: 'DR.Nedal').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    navigateTo(DoctorHome(info), context);
  }
  getDataHassan(context) async {
    CollectionReference appHassanM = FirebaseFirestore.instance.collection('appointment').doc('Monday').collection('Reservations');
    CollectionReference appHassanT = FirebaseFirestore.instance.collection('appointment').doc('Tuesday').collection('Reservations');
    CollectionReference appHassanW = FirebaseFirestore.instance.collection('appointment').doc('Wednesday').collection('Reservations');

    await appHassanM.where('doctorSelected', isEqualTo: 'DR.Hassan').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appHassanT.where('doctorSelected', isEqualTo: 'DR.Hassan').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appHassanW.where('doctorSelected', isEqualTo: 'DR.Hassan').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    navigateTo(DoctorHome(info), context);
  }
  getDataMKassem(context) async {
    CollectionReference appMKassemM = FirebaseFirestore.instance.collection('appointment').doc('Monday').collection('Reservations');
    CollectionReference appMKassemT = FirebaseFirestore.instance.collection('appointment').doc('Tuesday').collection('Reservations');
    CollectionReference appMKassemW = FirebaseFirestore.instance.collection('appointment').doc('Wednesday').collection('Reservations');

    await appMKassemM.where('doctorSelected', isEqualTo:'DR.Mohammad k').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appMKassemT.where('doctorSelected', isEqualTo:'DR.Mohammad k').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appMKassemW.where('doctorSelected', isEqualTo:'DR.Mohammad k').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    navigateTo(DoctorHome(info), context);
  }
  getDataAmal(context) async {

    CollectionReference appAmalM = FirebaseFirestore.instance.collection('appointment').doc('Monday').collection('Reservations');
    CollectionReference appAmalT = FirebaseFirestore.instance.collection('appointment').doc('Tuesday').collection('Reservations');
    CollectionReference appAmalW = FirebaseFirestore.instance.collection('appointment').doc('Wednesday').collection('Reservations');

    await appAmalM.where('doctorSelected', isEqualTo: 'DR.Amal').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appAmalT.where('doctorSelected', isEqualTo: 'DR.Amal').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });

    await appAmalW.where('doctorSelected', isEqualTo: 'DR.Amal').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    navigateTo(DoctorHome(info), context);
  }
  getDataMSaeed(context) async {
    CollectionReference appMSaeedM = FirebaseFirestore.instance.collection('appointment').doc('Monday').collection('Reservations');
    CollectionReference appMSaeedT = FirebaseFirestore.instance.collection('appointment').doc('Tuesday').collection('Reservations');
    CollectionReference appMSaeedW = FirebaseFirestore.instance.collection('appointment').doc('Wednesday').collection('Reservations');

    await appMSaeedM.where('doctorSelected', isEqualTo: 'DR.Mohammad').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appMSaeedT.where('doctorSelected', isEqualTo: 'DR.Mohammad').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appMSaeedW.where('doctorSelected', isEqualTo: 'DR.Mohammad').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    navigateTo(DoctorHome(info), context);
  }
  getDataAhmad(context) async {
    CollectionReference appAhmadM = FirebaseFirestore.instance.collection('appointment').doc('Monday').collection('Reservations');
    CollectionReference appAhmadT = FirebaseFirestore.instance.collection('appointment').doc('Tuesday').collection('Reservations');
    CollectionReference appAhmadW = FirebaseFirestore.instance.collection('appointment').doc('Wednesday').collection('Reservations');

    await appAhmadM.where('doctorSelected', isEqualTo: 'DR.Ahmad').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appAhmadT.where('doctorSelected', isEqualTo: 'DR.Ahmad').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appAhmadW.where('doctorSelected', isEqualTo: 'DR.Ahmad').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    navigateTo(DoctorHome(info), context);
  }
  getDataNaser(context) async {
    CollectionReference appNaserM = FirebaseFirestore.instance.collection('appointment').doc('Monday').collection('Reservations');
    CollectionReference appNaserT = FirebaseFirestore.instance.collection('appointment').doc('Tuesday').collection('Reservations');
    CollectionReference appNaserW = FirebaseFirestore.instance.collection('appointment').doc('Wednesday').collection('Reservations');

    await appNaserM.where('doctorSelected', isEqualTo: 'DR.Naser').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appNaserT.where('doctorSelected', isEqualTo: 'DR.Naser').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appNaserW.where('doctorSelected', isEqualTo: 'DR.Naser').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    navigateTo(DoctorHome(info), context);
  }
  getDataFahad(context) async {
    CollectionReference appGFahadM = FirebaseFirestore.instance.collection('appointment').doc('Monday').collection('Reservations');
    CollectionReference appGFahadT = FirebaseFirestore.instance.collection('appointment').doc('Tuesday').collection('Reservations');
    CollectionReference appGFahadW = FirebaseFirestore.instance.collection('appointment').doc('Wednesday').collection('Reservations');

    await appGFahadM.where('doctorSelected', isEqualTo: 'DR.Fahad').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appGFahadT.where('doctorSelected', isEqualTo: 'DR.Fahad').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await appGFahadW.where('doctorSelected', isEqualTo: 'DR.Fahad').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    navigateTo(DoctorHome(info), context);
  }

  getDataDoctor(context) async {
    CollectionReference docM = FirebaseFirestore.instance.collection('appointment').doc('Monday').collection('Reservations');
    CollectionReference docT = FirebaseFirestore.instance.collection('appointment').doc('Tuesday').collection('Reservations');
    CollectionReference docW = FirebaseFirestore.instance.collection('appointment').doc('Wednesday').collection('Reservations');

    await docM.where('doctorSelected', isEqualTo:'DR.hh').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await docT.where('doctorSelected', isEqualTo: 'DR.hh').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });
    await docW.where('doctorSelected', isEqualTo:'DR.hh').get().then((value) {
      for (var element in value.docs) {
        info.add(element.data());
        emit(SuccessState(info));
      }
    });

    navigateTo(DoctorHome(info), context);
  }

  List reports=[];
  getData(doctorSelected, context) async {
    if(doctorSelected=='DR.Amal') {
      CollectionReference amal = FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Amal');
      await amal.get().then((value) {
        for(var element in value.docs){
          reports.add(element.data());
          emit(RecepDataSuccess(reports));
        }
      });
      navigateTo(PatientRecord(reports), context);
      //Navigator.pushNamed(context,'report');
    }
    if(doctorSelected=='DR.Musallam') {
      CollectionReference musallam = FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Musallam');
      await musallam.get().then((value) {
        for(var element in value.docs){
          reports.add(element.data());
          emit(RecepDataSuccess(reports));
        }
      });
      navigateTo(PatientRecord(reports), context);
    }
    if(doctorSelected=='DR.Ahmad') {
      CollectionReference ahmad = FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Ahmad');
      await ahmad.get().then((value) {
        for(var element in value.docs){
          reports.add(element.data());
          emit(RecepDataSuccess(reports));
        }
      });

      navigateTo(PatientRecord(reports), context);
    }
    if(doctorSelected=='DR.Hassan') {
      CollectionReference hasan = FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Hasan');
      await hasan.get().then((value) {
        for(var element in value.docs){
          reports.add(element.data());
          emit(RecepDataSuccess(reports));
        }
      });
      navigateTo(PatientRecord(reports), context);
    }
    if(doctorSelected=='DR.Fahad') {
      CollectionReference fahad = FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Fahad');
      await fahad.get().then((value) {
        for(var element in value.docs){
          reports.add(element.data());
          emit(RecepDataSuccess(reports));
        }
      });
      navigateTo(PatientRecord(reports), context);
    }
    if(doctorSelected=='Dr.Ali') {
      CollectionReference ali = FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Ali');
      await ali.get().then((value) {
        for(var element in value.docs){
          reports.add(element.data());
          emit(RecepDataSuccess(reports));
        }
      });
      navigateTo(PatientRecord(reports), context);
    }
    if(doctorSelected=='DR.Nedal') {
      CollectionReference nedal = FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Nedal');
      await nedal.get().then((value) {
        for(var element in value.docs){
          reports.add(element.data());
          emit(RecepDataSuccess(reports));
        }
      });
      navigateTo(PatientRecord(reports), context);
    }
    if(doctorSelected=='DR.Mohammad k') {
      CollectionReference kassem = FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Mohammad k');
      await kassem.get().then((value) {
        for(var element in value.docs){
          reports.add(element.data());
          emit(RecepDataSuccess(reports));
        }
      });
      navigateTo(PatientRecord(reports), context);
    }
    if(doctorSelected=='DR.Mohammad') {
      CollectionReference saeed = FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Mohammad');
      await saeed.get().then((value) {
        for(var element in value.docs){
          reports.add(element.data());
          emit(RecepDataSuccess(reports));
        }
      });
      navigateTo(PatientRecord(reports), context);
    }
    if(doctorSelected=='DR.Naser') {
      CollectionReference naser = FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.Naser');
      await naser.get().then((value) {
        for(var element in value.docs){
          reports.add(element.data());
          emit(RecepDataSuccess(reports));
        }
      });
      navigateTo(PatientRecord(reports), context);
    }
    if(reports.isNotEmpty){
      navigateTo(PatientRecord(reports), context);
    }
    if(doctorSelected=='DR.hh'){
      CollectionReference doctor = FirebaseFirestore.instance.collection('patient').doc('Report').collection('DR.hh');
      await doctor.get().then((value) {
        for(var element in value.docs){
          reports.add(element.data());
          emit(RecepDataSuccess(reports));
        }});
      navigateTo(PatientRecord(reports), context);
      //Navigator.pushNamed(context,'report');
    }
    }

  }



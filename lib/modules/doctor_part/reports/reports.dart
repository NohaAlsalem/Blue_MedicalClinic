import 'dart:io';
import 'dart:math';

import 'package:blue_medical_clinic/modules/doctor_part/reports/write_report/cubit/cubit.dart';
import 'package:blue_medical_clinic/modules/doctor_part/reports/write_report/cubit/satats.dart';
import 'package:blue_medical_clinic/shared/components/components.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:path/path.dart';


class ReportDoctor extends StatelessWidget{
  List dataReport =[];
  ReportDoctor(data){
    this.dataReport= data;
  }

  text(String d,String t) {
    return Row(
      children: [
        Text(
          '$d :',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            //color: Color(0xAA420168),
          ),
        ),
        Text(
          ' $t',
          style: const TextStyle(
            //fontWeight: FontWeight.bold,
            fontSize: 20.0,
            //
            color: Color(0xAA420168),
          ),
        ),
      ],
    );
  }
  space(h,w){
    return SizedBox(height:h,width: w,);
  }
  var formKey = GlobalKey<FormState>();
  var report = TextEditingController();
  var diagnosis = TextEditingController();

  String message='No Input ';
  String imageUrlReport = 'https://firebasestorage.googleapis.com/v0/b/project1-4f713.appspot.com/o/Screenshot_20220810_122113_com.android.chrome_edit_226346558047753.jpg?alt=media&token=2a6e0e9d-3f8f-49d1-aba7-1abd628b0831';
  String imageUrlRadiographic='https://firebasestorage.googleapis.com/v0/b/project1-4f713.appspot.com/o/Screenshot_20220810_122113_com.android.chrome_edit_226346558047753.jpg?alt=media&token=2a6e0e9d-3f8f-49d1-aba7-1abd628b0831';
  String imageUrlTest='https://firebasestorage.googleapis.com/v0/b/project1-4f713.appspot.com/o/Screenshot_20220810_122113_com.android.chrome_edit_226346558047753.jpg?alt=media&token=2a6e0e9d-3f8f-49d1-aba7-1abd628b0831';

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context) => PatientReport(),
        child: BlocConsumer<PatientReport, StatestoReport>(
            listener: (context, state) {},
            builder:  (context, state) {
              return
                Scaffold(
                  body: Container(
                    decoration:const BoxDecoration(
                      color: Colors.white,
                      gradient:  LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xAA93f0fc),
                          Color(0xAAf3e5f5),
                          Color(0xAA93f0fc),
                          Color(0xAAd1c4e9),
                          Color(0xAAf3e5f5),
                        ],
                      ),
                    ),
                    child:Column(
                      children: [
                        Expanded(flex:1,
                          child: Container(
                            width:double.infinity,
                            decoration:const BoxDecoration(
                              color: Color(0xFF326fa5),
                              borderRadius:BorderRadius.only(bottomLeft:Radius.circular(40.0),bottomRight:Radius.circular(40.0)),
                            ),
                            clipBehavior:Clip.antiAliasWithSaveLayer,
                            child:Card(
                              shadowColor:const Color(0xAA420168),
                              elevation: 20,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color:const Color(0xAA93f0fc),
                              shape:const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                              ),
                              child:Lottie.asset('assets/clinical.json') ,
                            ),
                          ),
                        ),
                        const SizedBox(height:20.0),
                        Expanded(
                          flex:3,
                          child:
                          ListView.builder(
                            itemBuilder:(context,i) => reportWidget(context , i ,dataReport) ,
                            itemCount: dataReport.length,
                          ),
                        ),
                        TextButton(
                            onPressed: (){
                              PatientReport.get(context).getData(dataReport.last['doctorSelected'], context);
                            }, child:const Text('All Report'))
                      ],
                    ),
                  ),
                );
            }
        ));
  }

  Widget reportWidget (context ,i ,  List list ) => InkWell(
    onTap:(){},
    child: Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 20.0, end: 20.0, top: 0.0, bottom: 20.0),
      child: Material(
        shadowColor: const Color(0xFF326fa5),
        elevation: 20,
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          height: 60.0,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xAAf3e5f5),
                Color(0xAA9696C8),
              ],
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFF326fa5),
                  radius: 30.0,
                  child: Text(
                      '${dataReport[i]['hour']} : ${dataReport[i]['minute']}',
                      style: const TextStyle(color: Color(0xAAf3e5f5),)),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${dataReport[i]['name']}', style: const TextStyle(
                        color: Color(0xAA420168),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                      const SizedBox(height: 5.0),
                      Text('${dataReport[i]['date']}', style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                IconButton(
                    icon: const Icon(Icons.edit, color: Color(0xAA420168),),
                    onPressed: ()
                    {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder:(context) =>  BlocProvider(
                                create: (BuildContext context) => PatientReport(),
                                child: BlocConsumer<PatientReport,StatestoReport>(
                                    listener: (context, state) {},
                                    builder: (context, state) {
                                      return Scaffold(
                                        appBar: AppBar(
                                          title: const Text('Write Report'),
                                          backgroundColor:const Color(0xFF326fa5),
                                        ),
                                        body: Container(
                                          decoration: const BoxDecoration(
                                              gradient:  LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(0xAA93f0fc),
                                                  Color(0xAAd1c4e9),
                                                  Color(0xAAf3e5f5),
                                                  Color(0xAA93f0fc),
                                                  Color(0xAAf3e5f5),
                                                ],
                                              )
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(children: [
                                              Form(
                                                key: formKey,
                                                child: Column(children: [
                                                  space(20.0, 0.0),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(30.0),
                                                        color: const Color(0xAAd1c4e9),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(12.0),
                                                        child: Row(
                                                          children: [
                                                            const Icon(Icons.drive_file_rename_outline_outlined, color: Color(0xAA420168),),
                                                            const SizedBox(width: 15,),
                                                            Text(list[i]['name']),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(flex: 1,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(30.0),
                                                              color: const Color(0xAAd1c4e9),
                                                            ),
                                                            child:  Padding(
                                                              padding: const EdgeInsets.all(12.0),
                                                              child: Row(
                                                                children: [
                                                                  const Icon(Icons.male, color: Color(0xAA420168),),
                                                                  const SizedBox(width: 15,),
                                                                  Text('${list[i]['age']} '),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(flex: 1,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(30.0),
                                                              color: const Color(0xAAd1c4e9),
                                                            ),
                                                            child:  Padding(
                                                              padding: const EdgeInsets.all(12.0),
                                                              child: Row(
                                                                children: [
                                                                  const Icon(Icons.transgender_outlined, color: Color(0xAA420168),),
                                                                  const SizedBox(width: 15,),
                                                                  Text('${list[i]['gender']} '),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                      children:[
                                                        Expanded(flex: 1,
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(30.0),
                                                                  color: const Color(0xAAd1c4e9),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(12.0),
                                                                  child: Row(
                                                                    children: [
                                                                      const Icon(Icons.date_range_outlined, color: Color(0xAA420168),),
                                                                      const SizedBox(width: 15,),
                                                                      Text('${list[i]['date']} '),
                                                                    ],
                                                                  ),
                                                                )
                                                            ),
                                                          ),
                                                        ),
                                                      ]

                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(flex: 1,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(30.0),
                                                              color: const Color(0xAAd1c4e9),
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(12.0),
                                                              child: Row(
                                                                children: [
                                                                  const Icon(Icons.timelapse_outlined, color: Color(0xAA420168),),
                                                                  const SizedBox(width: 15,),
                                                                  Text('${list[i]['hour']} : ${list[i]['minute']}'),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(flex: 1,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(30.0),
                                                              color: const Color(0xAAd1c4e9),
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(12.0),
                                                              child: Row(
                                                                children: [
                                                                  const Icon(Icons.feed_outlined, color: Color(0xAA420168),),
                                                                  const SizedBox(width: 15,),
                                                                  Text('${list[i]['disease']}'),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(30.0),
                                                              color: const Color(0xAAd1c4e9),
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(12.0),
                                                              child: defaultTextFormField(
                                                                  controller: diagnosis,
                                                                  prefixIcon: Icons.drive_file_rename_outline_outlined,
                                                                  hint: 'Diagnosis',
                                                                  keyBoardType: TextInputType.name,
                                                                  label: 'Diagnosis',
                                                                  isPassword: false,
                                                                  validate: (value){
                                                                    if(value!.isEmpty){
                                                                      diagnosis.text = 'No input';
                                                                    }
                                                                  }
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(flex: 1,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: InkWell(
                                                            onTap: () {
                                                              showDialog(context: context,
                                                                builder: (context) =>
                                                                    AlertDialog(
                                                                      backgroundColor: const Color(0xAAd1c4e9),
                                                                      title: const Text(
                                                                        'select image', style: TextStyle(color: Color(0xFF326fa5),),),
                                                                      content: Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(30.0),
                                                                          color: const Color(0xFF326fa5),
                                                                        ),
                                                                        child: SingleChildScrollView(
                                                                          child: Column(
                                                                              children: <Widget>[
                                                                                ListTile(
                                                                                    leading: const Icon(Icons.image),
                                                                                    title: const Text('Gallery'),
                                                                                    onTap: () async {
                                                                                      var picked = await ImagePicker().pickImage(source: ImageSource.gallery);
                                                                                      if ( picked != null){
                                                                                        File  file = File(picked.path);
                                                                                        var rand = Random().nextInt(10000);
                                                                                        var imageName = '$rand'+ basename(picked.path);
                                                                                        var ref = FirebaseStorage.instance.ref('images').child(imageName);
                                                                                        await  ref.putFile(file);
                                                                                        imageUrlReport = await ref.getDownloadURL();
                                                                                        Navigator.of(context).pop();
                                                                                      }
                                                                                    }
                                                                                ),
                                                                                ListTile(
                                                                                    leading:const Icon(Icons.camera),
                                                                                    title: const Text('camera'),
                                                                                    onTap: () async {
                                                                                      var picked = await ImagePicker().pickImage(source: ImageSource.camera);
                                                                                      if ( picked != null){
                                                                                        File  file = File(picked.path);
                                                                                        var rand = Random().nextInt(10000);
                                                                                        var imageName = '$rand'+ basename(picked.path);
                                                                                        var ref = FirebaseStorage.instance.ref('images').child(imageName);
                                                                                        await  ref.putFile(file);
                                                                                        imageUrlReport = await ref.getDownloadURL();
                                                                                        Navigator.of(context).pop();
                                                                                      }
                                                                                    }
                                                                                ),
                                                                              ]
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                              );
                                                            },
                                                            child: Container(
                                                              height: 45.0,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(30.0),
                                                                color:const Color(0xAAd1c4e9),
                                                              ),
                                                              child:const Center(child: Icon(Icons.add_a_photo,
                                                                color: Color(0xFF326fa5),)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(flex: 2,
                                                        child:  Container(
                                                          height: 45,
                                                          decoration:    BoxDecoration(
                                                            borderRadius: BorderRadius.circular(50),
                                                            color: const Color(0xFF326fa5),
                                                          ),
                                                          child:const Center(child:
                                                          Text('Report image',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 17
                                                            ),)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(flex: 1,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: InkWell(
                                                            onTap: () {
                                                              showDialog(context: context,
                                                                builder: (context) =>
                                                                    AlertDialog(
                                                                      backgroundColor: const Color(0xAAd1c4e9),
                                                                      title: const Text(
                                                                        'select image', style: TextStyle(color: Color(0xFF326fa5),),),
                                                                      content: Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(30.0),
                                                                          color: const Color(0xFF326fa5),
                                                                        ),
                                                                        child: SingleChildScrollView(
                                                                          child: Column(
                                                                              children: <Widget>[
                                                                                ListTile(
                                                                                    leading: const Icon(Icons.image),
                                                                                    title: const Text('Gallery'),
                                                                                    onTap: () async {
                                                                                      var picked = await ImagePicker().pickImage(source: ImageSource.gallery);
                                                                                      if ( picked != null){
                                                                                        File  file = File(picked.path);
                                                                                        var rand = Random().nextInt(10000);
                                                                                        var imageName = '$rand'+ basename(picked.path);
                                                                                        var ref = FirebaseStorage.instance.ref('images').child(imageName);
                                                                                        await  ref.putFile(file);
                                                                                        imageUrlRadiographic = await ref.getDownloadURL();
                                                                                        Navigator.of(context).pop();
                                                                                      }
                                                                                    }
                                                                                ),
                                                                                ListTile(
                                                                                    leading:const Icon(Icons.camera),
                                                                                    title: const Text('camera'),
                                                                                    onTap: () async {
                                                                                      var picked = await ImagePicker().pickImage(source: ImageSource.camera);
                                                                                      if ( picked != null){
                                                                                        File  file = File(picked.path);
                                                                                        var rand = Random().nextInt(10000);
                                                                                        var imageName = '$rand'+ basename(picked.path);
                                                                                        var ref = FirebaseStorage.instance.ref('images').child(imageName);
                                                                                        await  ref.putFile(file);
                                                                                        imageUrlRadiographic = await ref.getDownloadURL();
                                                                                        Navigator.of(context).pop();
                                                                                      }
                                                                                    }
                                                                                ),
                                                                              ]
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                              );
                                                            },
                                                            child: Container(
                                                              height: 45.0,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(30.0),
                                                                color:const Color(0xAAd1c4e9),
                                                              ),
                                                              child:const Center(child: Icon(Icons.add_a_photo,
                                                                color: Color(0xFF326fa5),)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(flex: 2,
                                                        child:  Container(
                                                          height: 45,
                                                          decoration:    BoxDecoration(
                                                            borderRadius: BorderRadius.circular(50),
                                                            color: const Color(0xFF326fa5),
                                                          ),
                                                          child:const Center(child:
                                                          Text('Radiographic image',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 17
                                                            ),)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(flex: 1,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: InkWell(
                                                            onTap: () {
                                                              showDialog(context: context,
                                                                builder: (context) =>
                                                                    AlertDialog(
                                                                      backgroundColor: const Color(0xAAd1c4e9),
                                                                      title: const Text(
                                                                        'select image', style: TextStyle(color: Color(0xFF326fa5),),),
                                                                      content: Container(
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(30.0),
                                                                          color: const Color(0xFF326fa5),
                                                                        ),
                                                                        child: SingleChildScrollView(
                                                                          child: Column(
                                                                              children: <Widget>[
                                                                                ListTile(
                                                                                    leading: const Icon(Icons.image),
                                                                                    title: const Text('Gallery'),
                                                                                    onTap: () async {
                                                                                      var picked = await ImagePicker().pickImage(source: ImageSource.gallery);
                                                                                      if ( picked != null){
                                                                                        File  file = File(picked.path);
                                                                                        var rand = Random().nextInt(10000);
                                                                                        var imageName = '$rand'+ basename(picked.path);
                                                                                        var ref = FirebaseStorage.instance.ref('images').child(imageName);
                                                                                        await  ref.putFile(file);
                                                                                        imageUrlTest = await ref.getDownloadURL();
                                                                                        Navigator.of(context).pop();
                                                                                      }
                                                                                    }
                                                                                ),
                                                                                ListTile(
                                                                                    leading:const Icon(Icons.camera),
                                                                                    title: const Text('camera'),
                                                                                    onTap: () async {
                                                                                      var picked = await ImagePicker().pickImage(source: ImageSource.camera);
                                                                                      if ( picked != null){
                                                                                        File  file = File(picked.path);
                                                                                        var rand = Random().nextInt(10000);
                                                                                        var imageName = '$rand'+ basename(picked.path);
                                                                                        var ref = FirebaseStorage.instance.ref('images').child(imageName);
                                                                                        await  ref.putFile(file);
                                                                                        imageUrlTest = await ref.getDownloadURL();
                                                                                        Navigator.of(context).pop();
                                                                                      }
                                                                                    }
                                                                                ),
                                                                              ]
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                              );
                                                            },
                                                            child: Container(
                                                              height: 45.0,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(30.0),
                                                                color:const Color(0xAAd1c4e9),
                                                              ),
                                                              child:const Center(child: Icon(Icons.add_a_photo,
                                                                color: Color(0xFF326fa5),)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(flex: 2,
                                                        child:  Container(
                                                          //clipBehavior: Clip.antiAliasWithSaveLayer,
                                                          // width: 90,
                                                          height: 45,
                                                          decoration:    BoxDecoration(
                                                            borderRadius: BorderRadius.circular(50),
                                                            color: const Color(0xFF326fa5),
                                                          ),
                                                          child:const Center(child:
                                                          Text('Medical Tests image',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 17
                                                            ),)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      height: 162.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(30.0),
                                                        color:const Color(0xAAd1c4e9),
                                                      ),
                                                      child: defaultTextFormField(
                                                          controller: report,
                                                          prefixIcon: Icons.report,
                                                          keyBoardType: TextInputType.multiline,
                                                          label: 'public state patient',
                                                          isPassword: false,
                                                          hint: 'Write Report',
                                                          validate: (value){
                                                            if(value!.isEmpty){
                                                              report.text = 'No input';
                                                            }
                                                          }
                                                      ),
                                                    ),
                                                  ),
                                                ],),
                                              ),
                                              InkWell(
                                                onTap: ()
                                                {
                                                  PatientReport.get(context).addDataPatient(
                                                      dataReport.last['doctorSelected'].toString(),
                                                      list[i]['name'],
                                                      list[i]['age'],
                                                      list[i]['date'],
                                                      list[i]['gender'],
                                                      list[i]['hour'],
                                                      list[i]['minute'],
                                                      list[i]['disease'].toString(),
                                                      diagnosis.text,
                                                      report.text,
                                                      imageUrlReport,
                                                      imageUrlRadiographic,
                                                      imageUrlTest,
                                                      context);
                                                },
                                                child: Container(
                                                  width: 70.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(30.0),
                                                    color:const Color(0xFF326fa5),
                                                  ),
                                                  child:const Center(
                                                      child: Text('Save',
                                                        style: TextStyle(color: Color(0xAA93f0fc),),)),
                                                ),
                                              )
                                            ]),
                                          ),
                                        ),

                                      );
                                    }),
                              )
                          ));
                    }
                ),
              ]
          ),
        ),
      ),
    ),
  );



}

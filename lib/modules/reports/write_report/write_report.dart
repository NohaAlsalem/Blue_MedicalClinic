//import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../models/list_reports/list_report.dart';
import '../../../shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/satats.dart';


class writeReport extends StatelessWidget {

  //static const routeName = 'patient_details';
  DateTime? slactedTime;
  var formkey = GlobalKey<FormState>();

  var lastvisit = TextEditingController();

  var lasttime = TextEditingController();

  var name = TextEditingController();

  var age = TextEditingController();

  var gender = TextEditingController();

  var bloodtype = TextEditingController();

  var report = TextEditingController();


  String? imagePath;
  String dropdownvalue = 'public state';
  var items = ['public state', 'rediographic image', 'prescription',];

  // void instate() {
  //   super.initState();
  //   // loadImage();
  // }

  space(h, w) {
    return SizedBox(height: h, width: w,);
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final selcteed = areports.firstWhere((w) => w.id == id);

    return BlocProvider(
      create: (BuildContext context) => PatientReport(),
      child: BlocConsumer<PatientReport,Statestoreport>(
          listener: (context, state) {},
          builder: (context, state) {

            PatientReport cubit = PatientReport.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('write report'),
                backgroundColor: Color(0xFF326fa5),
              ),
              body: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xAA93f0fc),
                        // Color(0xAAEBE6EC),
                        Color(0xAAd1c4e9),
                        Color(0xAAf3e5f5),
                        Color(0xAA93f0fc),
                        Color(0xAAf3e5f5),
                      ],
                    )
                ),
                //},
                //  ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Form(
                      key: formkey,
                      child: Column(children: [
                        space(20.0, 0.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Color(0xAAd1c4e9),
                            ),
                            child: defaultTextFormField(

                              controller: name,
                              prefixIcon: Icons
                                  .drive_file_rename_outline_outlined,
                              hint: selcteed.name,
                              keyBoardType: TextInputType.name,
                              label: 'name patient',
                              isPassword: false,
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
                                    color: Color(0xAAd1c4e9),
                                  ),
                                  child: defaultTextFormField(

                                      controller: lasttime,
                                      prefixIcon: Icons.timelapse_outlined,
                                      hint: selcteed.time,
                                      keyBoardType: TextInputType.datetime,
                                      label: 'visit time',
                                      isPassword: false,
                                      onTap: () {
                                        showTimePicker(
                                            context: context,

                                            initialTime: TimeOfDay.now()).then((
                                            value) {
                                          lasttime.text =
                                              value!.format(context).toString();
                                          print(value!.format(context));
                                        });
                                      },
                                      validate: (value) {
                                        //if(value > 2.toString()&&value! < {4.toString()})
                                        return 'visit time between 2 and 4 ';
                                      }
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
                                    color: Color(0xAAd1c4e9),
                                  ),
                                  child: defaultTextFormField(
                                    controller: lastvisit,
                                    prefixIcon: Icons.date_range_outlined,
                                    hint: selcteed.date,
                                    keyBoardType: TextInputType.datetime,
                                    label: 'visit date',
                                    isPassword: false,
                                    onTap: () {
                                      // showDatePicker(
                                      //   context: context,
                                      //   initialDate: DateTime.now(),
                                      //   firstDate:DateTime(2020),
                                      //   lastDate: DateTime.parse('2023/2/2'),
                                      // ).then((value){
                                      //   if(value==null){return;}
                                      //   setState((){
                                      //     slactedTime =value;
                                      //   });
                                      // });
                                      showDatePicker(context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.parse('2022/7/3')
                                      ).then((value) {
                                        lastvisit.text =
                                            DateFormat.yMMMd().format(value!);
                                        print(
                                            DateFormat.yMMMd().format(value!));
                                      });
                                    },


                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //space()
                        Row(

                          children: [
                            Expanded(flex: 1,

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Color(0xAAd1c4e9),
                                  ),
                                  child: defaultTextFormField(

                                    controller: age,
                                    //prefixIcon:Icons.o,
                                    hint: '${selcteed.age}',
                                    keyBoardType: TextInputType.number,
                                    label: 'age the patient',
                                    isPassword: false,
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
                                    color: Color(0xAAd1c4e9),
                                  ),
                                  child: defaultTextFormField(
                                    controller: gender,
                                    prefixIcon: Icons.transgender_outlined,
                                    hint: selcteed.gender,
                                    keyBoardType: TextInputType.text,
                                    label: 'gender patient',
                                    isPassword: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Color(0xAAd1c4e9),
                            ),
                            child: defaultTextFormField(

                              controller: bloodtype,
                              prefixIcon: Icons.bloodtype,
                              hint: selcteed.bloodtype,
                              keyBoardType: TextInputType.name,
                              label: 'bloodtype patient',
                              isPassword: false,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            // imageFile!=null?
                            // Image.file(imageFile!,fit:BoxFit.cover,
                            // ):
                            // Center(
                            //     child: Text('add product image here',style: TextStyle(fontSize: 20.0),)),
                            Expanded(flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    showDialog(context: context,
                                      builder: (context) =>
                                          AlertDialog(
                                            backgroundColor: Color(0xAAd1c4e9),
                                            title: Text(
                                              'select image', style: TextStyle(color: Color(0xFF326fa5),),),
                                            content: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30.0),
                                                color: Color(0xFF326fa5),
                                              ),

                                              child: SingleChildScrollView(
                                                child: Column(
                                                    children: <Widget>[
                                                      ListTile(
                                                          leading: Icon(Icons.image),
                                                          title: Text('Gallerry'),
                                                          onTap: () {
                                                            cubit.imageFromGallery(context);
                                                          }
                                                        //}
                                                        //  }
                                                        //imageFromGallery(context),
                                                      ),
                                                      ListTile(
                                                        leading: Icon(Icons.camera),
                                                        title: Text('camera'),
                                                        onTap: (){
                                                          cubit.imageFromCamera(context);
                                                        },
                                                      ),
                                                    ]
                                                ),
                                              ),
                                            ),
                                          ),
                                    );
                                  },
                                  child: Container(
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Color(0xAAd1c4e9),
                                    ),
                                    child: Center(child: Icon(Icons.add_a_photo,
                                      color: Color(0xFF326fa5),)),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: DropdownButton(
                                    dropdownColor: Color(0xFF326fa5),
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(30),
                                    value:cubit.dropdownvalue,
                                    icon: Icon(Icons.arrow_drop_down,
                                      color: Color(0xFF326fa5),),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(value: items,
                                        child: Text(items),);
                                    }
                                    ).toList(),
                                    onChanged:
                                        (newValue) {
                                          cubit.change(newValue);
                                    },


                                  ),
                                ),
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
                              color: Color(0xAAd1c4e9),
                            ),
                            child: defaultTextFormField(

                              controller: report,
                              prefixIcon: Icons.report,
                              //hint: selcteed.bloodtype,
                              keyBoardType: TextInputType.multiline,
                              label: 'public state patient',
                              isPassword: false,
                            ),
                          ),
                        ),

                      ],),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 70.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0xFF326fa5),
                        ),
                        child: Center(
                            child: Text('Save',
                              style: TextStyle(color: Color(0xAA93f0fc),),)),
                      ),
                    )
                  ]),
                ),
              ),

            );
          }),
    );
  }
}
  // void showOption(BuildContext context) async {
  //   return showDialog(context: context,
  //     builder: (context) =>
  //         AlertDialog(
  //           backgroundColor: Color(0xAAd1c4e9),
  //           title: Text(
  //             'select image', style: TextStyle(color: Color(0xFF326fa5),),),
  //           content: Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(30.0),
  //               color: Color(0xFF326fa5),
  //             ),
  //
  //             child: SingleChildScrollView(
  //               child: Column(
  //                   children: <Widget>[
  //                     ListTile(
  //                       leading: Icon(Icons.image),
  //                       title: Text('Gallerry'),
  //                       onTap: () {
  //                       cubit. imageFromGallery(context);
  //                         }
  //                       //}
  //                      //  }
  //                         //imageFromGallery(context),
  //                     ),
  //                     ListTile(
  //                       leading: Icon(Icons.camera),
  //                       title: Text('camera'),
  //                       onTap: (context) => cubit.imageFromCamera(context),
  //                     ),
  //                   ]
  //               ),
  //             ),
  //           ),
  //         ),
  //   );
  //
  // }


// void imageFromGallery(BuildContext context) async{
//   var image=await ImagePicker().pickImage(source:ImageSource.gallery);
//   setState((){
//     imageFile=image as File?;
//   });
// }
//
// void imageFromCamera(BuildContext context) async{
//   var imagec=await ImagePicker().pickImage(source:ImageSource.camera);
//   setState((){
//     imageFile=imagec as File?;
//   });
//
// }
// }


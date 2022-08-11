

class PatientModel{

  late String name ;
  late String age ;
  late String gender;
  late String disease;
  late String date;
  late int hour ;
  late int minute ;
  late String diagnosis;
  late String report;
  String? imageReport;
  String? imageRadiographic;
  String? imageMedicalTests;

  PatientModel({
    required this.name ,
    required this.age ,
    required this.gender,
    required this.date,
    required this.hour,
    required this.minute,
    required this.diagnosis,
    required this.disease,
    required this.report,
    required this.imageReport,
    required this.imageRadiographic,
    required this.imageMedicalTests,
  });


  PatientModel.fromJson(Map<String , dynamic> json)
  {
    name = json ['name'];
    age = json ['age'];
    gender = json['gender'];
    date =json['date'];
    hour = json['hour'];
    minute  = json['minute'];
    disease = json['disease'];
    diagnosis = json['diagnosis'];
    report = json['report'];
    imageReport = json['imageReport'];
    imageRadiographic =json['imageRadiographic'];
    imageMedicalTests = json['imageMedicalTests'];

  }

  Map<String , dynamic> toMap(context)
  {
    return
      {
        'name':name,
        'age' : age,
        'gender':gender,
        'date': date,
        'hour': hour,
        'minute':minute,
        'disease':disease,
        'diagnosis':diagnosis,
        'report':report,
        'imageReport': imageReport,
        'imageRadiographic': imageRadiographic ,
        'imageMedicalTests': imageMedicalTests ,

      };
  }

}
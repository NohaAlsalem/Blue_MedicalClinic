
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
      };
  }

}
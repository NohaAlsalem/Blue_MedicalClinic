
class UserModel{

  late String name ;
  late String age ;
  late String phone ;
  late String gender;
  late String disease;
  late String date;
  late int hour ;
  late int minute ;
  late String doctorSelected;

  UserModel({
    required this.name ,
    required this.age ,
    required this.phone,
    required this.gender,
    required this.date,
    required this.hour,
    required this.minute,
    required this.doctorSelected,
    required this.disease,
  });


  UserModel.fromJson(Map<String , dynamic> json)
  {
    name = json ['name'];
    age = json ['age'];
    phone = json['phone'];
    gender = json['gender'];
    disease = json['disease'];
    date = json['date'];
    hour = json['hour'];
    minute  = json['minute'];
    doctorSelected = json['doctorSelected'];
  }

  Map<String , dynamic> toMap(context)
  {
    return
      {
        'name':name,
        'age' : age,
        'phone':phone,
        'gender':gender,
        'disease':disease,
        'date': date,
        'hour': hour,
        'minute':minute,
        'doctorSelected':doctorSelected,
      };
  }

}
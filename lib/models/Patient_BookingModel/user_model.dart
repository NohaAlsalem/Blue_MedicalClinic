
class UserModel{

   String? name ;
  late String age ;
  late String phone ;
  late String gender;
  late String disease;
   String? date;
  late int hour ;
  late int minute ;
  late String doctorSelected;
  late String daySelected;

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
    required this.daySelected
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
    daySelected=json['daySelected'];
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
        'daySelected':daySelected,

      };
  }

}

class UserModel{

  late String name ;
  late String age ;
  late String id ;
  late String phone ;
  late int hour ;
  late int minute ;
  late String doctorSelected;

  UserModel({
    required this.name ,
    required this.age ,
    required this.id ,
    required this.phone,
    required this.hour,
    required this.minute,
    required this.doctorSelected,
  });


  UserModel.fromJson(Map<String , dynamic> json)
  {
    name = json ['name'];
    age = json ['age'];
    id = json['id'];
    phone = json['phone'];
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
        'id': id,
        'phone':phone,
        'hour': hour,
        'minute':minute,
        'Doctorname':doctorSelected,
      };
  }

}
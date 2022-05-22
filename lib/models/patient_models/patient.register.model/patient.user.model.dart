class PatientRegisterModel {
  String? userId;
  String? name;
  String? email;
  String? phone;
  PatientRegisterModel({
    this.userId,
    this.name,
    this.email,
    this.phone,
  });
  PatientRegisterModel.formJson(Map<String, dynamic> json) {
    name   = json['name'];
    userId = json['uId'];
    email  = json['email'];
    phone  = json['phone'];
  }
  Map<String, dynamic> toMap(){
     return{
       'uId':userId,
       'name': name,
       'email':email,
       'phone':phone,
     };
  }
}

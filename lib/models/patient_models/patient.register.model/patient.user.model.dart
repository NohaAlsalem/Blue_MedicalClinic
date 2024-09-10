class PatientRegisterModel {
  String? userId;
  String? name;
  String? email;
  String? phone;
  String? fcmToken;
  PatientRegisterModel({
    this.userId,
    this.name,
    this.email,
    this.phone,
    this.fcmToken,
  });
  PatientRegisterModel.formJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['uId'];
    email = json['email'];
    phone = json['phone'];
    fcmToken = json['fcm_token'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uId': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'fcm_token': fcmToken,
    };
  }
}

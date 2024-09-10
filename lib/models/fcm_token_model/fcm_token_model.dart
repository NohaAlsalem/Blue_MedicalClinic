class FcmTokenModel {
  String? email;
  String? fcmToken;
  FcmTokenModel({required this.fcmToken , required this.email});
  FcmTokenModel.fromJson(Map<String, dynamic> json) {
    email = json['patient_Email'];
    fcmToken = json['fcm_token'];
  }
  Map<String, dynamic> toMap() {
    return {
      'patient_Email': email,
      'fcm_token': fcmToken,
    };
  }
}

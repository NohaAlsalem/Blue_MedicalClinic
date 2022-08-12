class FcmTokenModel {
  String? fcmToken;
  FcmTokenModel({required this.fcmToken});
  FcmTokenModel.fromJson(Map<String, dynamic> json) {
    fcmToken = json['fcm_token'];
  }
  Map<String, dynamic> toMap() {
    return {
      'fcm_token': fcmToken,
    };
  }
}

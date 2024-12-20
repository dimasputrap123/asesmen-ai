class LoginData {
  String? token;

  LoginData({this.token});

  LoginData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}

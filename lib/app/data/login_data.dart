class LoginData {
  String? token;
  String? email;
  String? name;
  int? id;

  LoginData({this.token, this.email, this.name, this.id});

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    token = json['token'];
  }
}

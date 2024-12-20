class ProfileData {
  int? id;
  String? email;
  String? name;

  ProfileData({this.id, this.email, this.name});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
  }
}

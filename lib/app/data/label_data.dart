class LabelData {
  int? id;
  String? text;

  LabelData({this.id, this.text});

  LabelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
  }
}

class Model {
  final String title;
  final String type;
  final String image;
  final String clickUrl;
  final String time;
  final String top;

  Model(
      {required this.title,
      required this.type,
      required this.image,
      required this.clickUrl,
      required this.time,
      required this.top});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      title: json['title'],
      type: json['type'],
      image: json['img'],
      clickUrl: json['click_url'],
      time: json['time'],
      top: json['top'],
    );
  }
}

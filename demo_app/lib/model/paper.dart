class NewsPaper {
  String id;
  String image;
  String title;
  String description;
  String date;
  NewsPaper(
      {required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.date});

  factory NewsPaper.fromJson(Map<String, dynamic> json) {
    return NewsPaper(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
    );
  }
}

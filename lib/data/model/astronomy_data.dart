class AstronomyData {
  final String title;
  final String date;
  final String explanation;
  final String url;

  AstronomyData(
      {required this.title,
      required this.date,
      required this.explanation,
      required this.url});

  factory AstronomyData.fromJson(Map<String, dynamic> json) {
    return AstronomyData(
        title: json['title'],
        date: json['date'],
        explanation: json['explanation'],
        url: json['url']);
  }
}

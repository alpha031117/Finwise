class Article {
  String title;

  DateTime date;
  String author;
  String type;

  static var length;

  Article({
    required this.title,
    required this.date,
    required this.author,
    required this.type,
  });
}
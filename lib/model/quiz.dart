class quiz {
  String title;
  int points;
  String id;
  Map<String, bool> options;

  static var length;

  quiz({
    required this.id,
    required this.title,
    required this.points,
    required this.options,
  });
}

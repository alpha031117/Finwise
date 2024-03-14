class quiz1 {
  String title;
  int points;
  String id;
  Map<String, bool> options;

  static var length;

  quiz1({
    required this.id,
    required this.title,
    required this.points,
    required this.options,
  });
}

class Episode {
  String title;
  String host;
  String durationInMinutes;
  DateTime releaseDate;
  String audioPath;
  String imagePath;
  String? showNotes;

  Episode({
    required this.title,
    required this.durationInMinutes,
    required this.releaseDate,
    required this.audioPath,
    required this.imagePath,
    required this.host,
    this.showNotes,
  });
  // you can set the initial values of instance variables based on the provided constructor parameters. This allows you to conveniently initialize the object's state during object creation.
}

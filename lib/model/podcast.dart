import 'podcast_episode.dart';

class Podcast {
  String title;
  String host;
  DateTime releaseDate;
  String imagePath;

  List<Episode> episodes;

  Podcast({
    required this.title,
    required this.host,
    required this.releaseDate,
    required this.imagePath,
    required this.episodes,
  });
}

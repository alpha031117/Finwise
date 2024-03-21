import 'package:vhack_finwise_app/model/new.dart';

class SavedNewsScreen {
  static List<News> savedNewsCard = [];

  static void addSavedNewsCard(News newscard) {
    savedNewsCard.add(newscard);
    // Implement logic to store savedNews persistently
  }

  static void removeSavedNewsCard(News newscard) {
    savedNewsCard.remove(newscard);
    // Implement logic to update stored savedNews
  }

  static List<News> getSavedNewsCard() {
    // Retrieve savedNews from storage
    return savedNewsCard;
  }


}
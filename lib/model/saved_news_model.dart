import 'package:vhack_finwise_app/model/search_screen_model.dart';
import 'package:vhack_finwise_app/model/new.dart';

class SavedNewsScreen {
  static List<search_screen_new> savedNews = [];
  static List<New> savedNewCard = [];

   static void addSavedNews(search_screen_new searchnews) {
    savedNews.add(searchnews);
    // Implement logic to store savedNews persistently
  }

  static void removeSavedNews(search_screen_new searchnews) {
    savedNews.remove(searchnews);
    // Implement logic to update stored savedNews
  }

  static List<search_screen_new> getSavedNews() {
    // Retrieve savedNews from storage
    return savedNews;
  }

  static void addSavedNewsCard(New newscard) {
    savedNewCard.add(newscard);
    // Implement logic to store savedNews persistently
  }

  static void removeSavedNewsCard(New newscard) {
    savedNewCard.remove(newscard);
    // Implement logic to update stored savedNews
  }

  static List<New> getSavedNewsCard() {
    // Retrieve savedNews from storage
    return savedNewCard;
  }


}
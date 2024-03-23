import 'package:vhack_finwise_app/model/new.dart';
import 'package:vhack_finwise_app/model/global_screen_news_model.dart';
import 'package:vhack_finwise_app/model/local_screen_news_model.dart';


//mimic database
class SavedNewsDatabase {
  static List<News> savedNewsCard = [];
  static List<GlobalNews> savedGlobalNews = [];
  static List<LocalNews> savedLocalNews = [];

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

  
  static void addSavedGlobalNews(GlobalNews globalnewss) {
    savedGlobalNews.add(globalnewss);
    // Implement logic to store savedNews persistently
  }

  static void removeSavedGlobalNews(GlobalNews globalnewss) {
    savedGlobalNews.remove(globalnewss);
    // Implement logic to update stored savedNews
  }

  static List<GlobalNews> getSavedGlobalNews() {
    // Retrieve savedNews from storage
    return savedGlobalNews;
  }

    static void addSavedLocalNews(LocalNews localNews) {
    savedLocalNews.add(localNews);
    // Implement logic to store savedNews persistently
  }

  static void removeSavedLocalNews(LocalNews localNews) {
    savedLocalNews.remove(localNews);
    // Implement logic to update stored savedNews
  }

  static List<LocalNews> getSavedLocalNews() {
    // Retrieve savedNews from storage
    return savedLocalNews;
  }


}
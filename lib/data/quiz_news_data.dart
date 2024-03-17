import 'package:vhack_finwise_app/model/quiz_news.dart';

class QuizDatabase {
  static List<Quiz> quizz = [
    Quiz(
        id: 'hello',
        points: 0,
        title: "Did the stock market decline on March 8, 2024, due to a jobs report indicating a cooling labor market, despite adding more jobs than economists had anticipated?",
        options: {
          'True':true,
          'False':false,

          }
        ),

  ];
}

import 'package:vhack_finwise_app/model/quiz.dart';

class QuizDatabase {
  static List<Quiz> quizz = [
    Quiz(
        id: 'hello',
        points: 0,
        title: "What is a way to best describe a mutual fund?",
        options: {
          'A basket filled with various fruits representing individual stocks and bonds':true,
          'A collection of rare artifacts owned by a group of people':false,
          'A type of personal loan offered by a bank':false,
          'A single stock with high potential for growth':false,
          }
        ),
    
    Quiz(
        id: 'hello',
        points: 0,
        title: "Mutual funds are the guaranteed way to make money.",
        options: {
          'True':false,
          'False':true,
          }
        ),
        
    Quiz(
        id: 'hello',
        points: 0,
        title: "Investing in stocks guarantees a profit.",
        options: {
          'True':false,
          'False':true,

          }
        ),

  ];
  
}

import 'package:vhack_finwise_app/model/quiz.dart';

class QuizDatabase {
  static String sampleExplanation =
      'The explanation for the quiz is currently in progress. We are diligently working on providing comprehensive insights and clarifications to enhance your understanding. Please stay tuned for further updates as we finalize the explanation for the quiz.';
  static List<Quiz> quizz = [
    Quiz(
        id: 'hello',
        points: 0,
        title: "What is a way to best describe a mutual fund?",
        options: {
          'A basket filled with various fruits representing individual stocks and bonds':
              true,
          'A collection of rare artifacts owned by a group of people': false,
          'A type of personal loan offered by a bank': false,
          'A single stock with high potential for growth': false,
        },
        isAnswered: false),
    Quiz(
      id: 'savings',
      points: 0,
      title: "Which of the following is a common type of savings account?",
      options: {
        'Checking account': false,
        'Money market account': true,
        'Credit card account': false,
        'Investment account': false,
      },
      isAnswered: false,
    ),
    Quiz(
      id: 'real_estate',
      points: 0,
      title: "What does MLS stand for in real estate?",
      options: {
        'Multiple Listing Service': true,
        'Major League Soccer': false,
        'Market Listing System': false,
        'Mortgage Lender Service': false,
      },
      isAnswered: false,
    ),

    //true pr false quiz
    Quiz(
      id: 'hello',
      points: 0,
      title: "Mutual funds are the guaranteed way to make money.",
      options: {
        'True': false,
        'False': true,
      },
      isAnswered: false,
    ),
    Quiz(
      id: 'hello',
      points: 0,
      title: "Investing in stocks guarantees a profit.",
      options: {
        'True': false,
        'False': true,
      },
      isAnswered: false,
    ),

    Quiz(
      id: 'mutual_funds_risk',
      points: 0,
      title: "Investing in mutual funds is risk-free.",
      options: {
        'True': false,
        'False': true,
      },
      isAnswered: false,
    ),
    Quiz(
      id: 'diversification',
      points: 0,
      title: "Diversifying your investment portfolio can reduce risk.",
      options: {
        'True': true,
        'False': false,
      },
      isAnswered: false,
    ),
    Quiz(
      id: 'stock_dividends',
      points: 0,
      title: "All stocks pay dividends to their shareholders.",
      options: {
        'True': false,
        'False': true,
      },
      isAnswered: false,
    ),
    Quiz(
      id: 'real_estate_appreciation',
      points: 0,
      title: "Real estate properties always appreciate in value over time.",
      options: {
        'True': false,
        'False': true,
      },
      isAnswered: false,
    ),
  ];
}

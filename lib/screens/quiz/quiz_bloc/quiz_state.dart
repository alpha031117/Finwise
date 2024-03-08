part of 'quiz_bloc.dart';

sealed class QuizState extends Equatable {
  const QuizState();
  
  @override
  List<Object> get props => [];
}

final class QuizInitial extends QuizState {}

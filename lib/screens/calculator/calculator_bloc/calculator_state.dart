part of 'calculator_bloc.dart';

sealed class CalculatorState extends Equatable {
  const CalculatorState();

  @override
  List<Object> get props => [];
}

sealed class CalculatorActionState extends CalculatorState {}

final class CalculatorInitial extends CalculatorState {}

final class CalculatorLoadingState extends CalculatorState {}

final class CalculatorLoadedState extends CalculatorState {
  final List<IndividualBar> futureInvestmentValueList;

  const CalculatorLoadedState(this.futureInvestmentValueList);

  @override
  List<Object> get props => [futureInvestmentValueList];
}

final class CalculatorError extends CalculatorActionState {
  final String message;
  CalculatorError(this.message);
  @override
  List<Object> get props => [message];
}

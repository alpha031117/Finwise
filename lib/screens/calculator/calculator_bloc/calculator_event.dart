part of 'calculator_bloc.dart';

sealed class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

//loads the initial graph
final class CalculatorInitialEvent extends CalculatorEvent {}

final class CalculatorCalculateMyEstimateEvent extends CalculatorEvent {
  final double initialDeposit;
  final double contributions;
  final int yearsToGrow;
  final double averageAnnualReturn;
  final String compoundFrequency;
  final String period;

  const CalculatorCalculateMyEstimateEvent({required this.initialDeposit, required this.contributions, required this.yearsToGrow, required this.averageAnnualReturn, required this.compoundFrequency, required this.period});
}

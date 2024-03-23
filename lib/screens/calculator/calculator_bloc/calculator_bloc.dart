import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vhack_finwise_app/screens/calculator/graph/individual_bar.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

Future<List<IndividualBar>> calculateFutureInvestmentValue(
  double initialInvestment,
  double interestRate,
  int years,
  String compoundFrequency,
  double depositAmount,
  String period,
) async {
  //default, intial investnment = 1000, interest rate = 3, years = 10, compound frequency = annually, deposit amount = 0, period = beginning
  double compoundInterval = 0;
  double x = initialInvestment;
  double y = 0;
  //return a inividual bar list, where x is the year, y is the amount
  List<IndividualBar> futureInvestmentValueList = [];

  int currentYear = DateTime.now().year;
  switch (compoundFrequency) {
    case 'Daily':
      compoundInterval = 365;
      y = 1 / 365;
      break;
    case 'Weekly':
      compoundInterval = 52;
      y = 1 / 52;
      break;
    case 'Monthly':
      compoundInterval = 12;
      y = 1 / 12;
      break;
    case 'Quarterly':
      compoundInterval = 4;
      y = 1 / 4;
      break;
    case 'Annually':
      compoundInterval = 1;
      for (int i = 0; i < years; i++) {
        if (period == 'End') {
          x = (x * (interestRate / 100)) + x;
          x = x + depositAmount;
        } else if (period == 'Beginning') {
          x = x + depositAmount;
          x = (x * (interestRate / 100)) + x;
        } else {
          x = (x * (interestRate / 100)) + x;
        }
        double roundedAmount = double.parse(x.toStringAsFixed(2));
        //x value is the year
        // y value is the amount
        futureInvestmentValueList
            .add(IndividualBar(currentYear + i, roundedAmount));
      }
      // print(futureInvestmentValueList);
      break;
  }

  if (compoundFrequency != 'Annually') {
    for (int i = 0; i < years; i++) {
      for (int k = 0; k < compoundInterval; k++) {
        if (period == 'End') {
          x = (x * (interestRate / 100) * y) + x;
          x = x + depositAmount;
        } else if (period == 'Beginning') {
          x = x + depositAmount;
          x = (x * (interestRate / 100) * y) + x;
        } else {
          x = (x * (interestRate / 100) * y) + x;
        }
      }
      double roundedAmount = double.parse(x.toStringAsFixed(2));
      futureInvestmentValueList
          .add(IndividualBar(currentYear + i, roundedAmount));
      // print(futureInvestmentValueList);
    }
  }

  return futureInvestmentValueList;
}

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial()) {
    on<CalculatorCalculateMyEstimateEvent>(calculatorCalculateMyEstimateEvent);
    on<CalculatorInitialEvent>(calculatorInitialEvent);
  }

  FutureOr<void> calculatorCalculateMyEstimateEvent(
      CalculatorCalculateMyEstimateEvent event,
      Emitter<CalculatorState> emit) async {
    try {
      List<IndividualBar> futureInvestmentValueList =
          await calculateFutureInvestmentValue(
        event.initialDeposit,
        event.averageAnnualReturn,
        event.yearsToGrow,
        event.compoundFrequency,
        event.contributions,
        event.period,
      );

      emit(
        CalculatorLoadedState(futureInvestmentValueList),
      );
    } catch (e) {
      emit(
        CalculatorError(e.toString()),
      );
    }
  }

  FutureOr<void> calculatorInitialEvent(
      CalculatorInitialEvent event, Emitter<CalculatorState> emit) async {
    emit(CalculatorLoadingState()); // Emit loading state immediately
    Future.delayed(Duration(seconds: 2));
    final List<IndividualBar> futureInvestmentValueList =
        await calculateFutureInvestmentValue(
      1000,
      3,
      10,
      'Annually',
      0,
      'Beginning',
    );

    // print(futureInvestmentValueList);

    emit(CalculatorLoadedState(
        futureInvestmentValueList)); // Emit loaded state with the calculated list
  }
}

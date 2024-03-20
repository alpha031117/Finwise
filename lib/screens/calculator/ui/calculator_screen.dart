import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vhack_finwise_app/screens/calculator/calculator_bloc/calculator_bloc.dart';
import 'package:vhack_finwise_app/screens/calculator/graph/bar_graph.dart';
import 'package:vhack_finwise_app/screens/calculator/graph/individual_bar.dart';
import 'package:vhack_finwise_app/screens/calculator/ui/widget/years_to_grow.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

import 'widget/calculator_textfield.dart';
import 'widget/deposit_segmented_button.dart';
import 'widget/potential_future_balance.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _calculatorBloc = CalculatorBloc();

  //controllers
  final ScrollController _scrollController = ScrollController();
  TextEditingController initialDepositController = TextEditingController();
  TextEditingController contributionsController = TextEditingController();
  TextEditingController annualReturnController = TextEditingController();

  @override
  void dispose() {
    initialDepositController.dispose();
    contributionsController.dispose();
    annualReturnController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calculatorBloc.add(CalculatorInitialEvent());
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 0; // This Week
  }

  //getters for controllers and defaults
  //get the string value of the text fields
  double get principal =>
      double.tryParse(initialDepositController.text) ?? 1000; //P
  double get contributions =>
      double.tryParse(contributionsController.text) ?? 0.0;
  double get interestRate =>
      double.tryParse(annualReturnController.text) ?? 3; // r
  String selectedContribution = "Annually";
  int yearsToGrow = 10;
  String selectedPeriod = 'Beginning';
  String period = "End";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorBloc, CalculatorState>(
      bloc: _calculatorBloc,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case CalculatorLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case CalculatorLoadedState:
            List<IndividualBar> loadedFutureInvestmentValueList =
                (state as CalculatorLoadedState).futureInvestmentValueList;

            final potentialFutureBalance =
                loadedFutureInvestmentValueList.last.y;

            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: GlobalVariables.horizontalPadding,
                    ),
                    child: Column(
                      children: [
                        //potential return
                        Padding(
                          padding: const EdgeInsets.all(25),
                          child: PotentialFutureBalance(
                              defaultPotentialFutureBalance:
                                  potentialFutureBalance.toString()),
                        ),
                        //graph
                        Container(
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: GlobalVariables.secondaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: BarChartWidget(
                              bars: loadedFutureInvestmentValueList,
                              yearsToGrow: yearsToGrow,
                              initialDeposit: principal,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        //graph description
                        Text(
                            'Check out our compound interest calculator to see just how much the power of tme and compound interest can help your money grow',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontFamily:
                                  GlobalVariables.titleFont().fontFamily,
                              fontWeight: FontWeight.w400,
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        //initial deposit
                        CalculatorTextField(
                          title: 'INITIAL DEPOSIT',
                          radioButton: false,
                          isAnnualReturn: false,
                          controller: initialDepositController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //contributions
                        CalculatorTextField(
                          title: 'CONTRIBUTIONS',
                          radioButton: true,
                          isAnnualReturn: false,
                          controller: contributionsController,
                          radioButtonValue: (value) {
                            setState(() {
                              selectedContribution = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        DepositSegmentedButton(
                          onValueChanged: (newValue) {
                            setState(() {
                              selectedPeriod = newValue;
                            });
                            print(selectedPeriod);
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //years to grow slider
                        YearsToGrow(
                            yearsToGrow: yearsToGrow,
                            onChanged: (value) {
                              setState(() {
                                yearsToGrow = value;
                              });
                            }),

                        //average annual return
                        CalculatorTextField(
                          title: 'AVERAGE ANNUAL RETURN',
                          radioButton: false,
                          isAnnualReturn: true,
                          controller: annualReturnController,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        //calculate my estimate button
                        TextButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              Size(MediaQuery.of(context).size.width * 0.8, 70),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => GlobalVariables.tertiaryColor),
                            foregroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white,
                            ),
                          ),
                          onPressed: () {
                            _calculatorBloc.add(
                              CalculatorCalculateMyEstimateEvent(
                                initialDeposit: principal,
                                averageAnnualReturn: interestRate,
                                yearsToGrow: yearsToGrow,
                                compoundFrequency: selectedContribution,
                                contributions: contributions,
                                period: selectedPeriod,
                              ),
                            );

                            _scrollController.animateTo(
                              0.0,
                              duration: Duration(
                                  milliseconds: 500), // Adjust as needed
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text('Calculate My Estimate'),
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          default:
            return const Center(
              child: Text('Unexpected Error Occurred'),
            );
        }
      },
    );
  }
}

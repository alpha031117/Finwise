import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/screens/calculator/ui/widget/years_to_grow.dart';

import 'individual_bar.dart';

class BarChartWidget extends StatefulWidget {
  final int yearsToGrow;
  final double initialDeposit;
  final List<IndividualBar> bars;

  const BarChartWidget(
      {super.key,
      required this.bars,
      required this.yearsToGrow,
      required this.initialDeposit});

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  List<int> calculateInterval() {
    final List<int> xIntervals = [];
    double maxY = widget.bars.last.y;
    int interval = (maxY / 4).ceil();
    for (int i = 0; i < 5; i++) {
      xIntervals.add(interval * i);
    }
    return xIntervals;
  }

  int getXIntervals(int years) {
    if (years < 20) {
      return 2;
    } else if (years >= 20 && years < 30) {
      return 4;
    } else {
      return 6;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.grey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              // Assuming your bars list is accessible here
              if (widget.bars.isNotEmpty && rodIndex < widget.bars.length) {
                final IndividualBar individualBar = widget.bars[groupIndex];
                return BarTooltipItem(
                  'Potential balance: ${individualBar.y.toString()} \n Potential earned interests: ${individualBar.y - widget.initialDeposit}.', // Displaying y-value of IndividualBar
                  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
              return BarTooltipItem(
                  '',
                  TextStyle(
                      color: Colors.transparent)); // Hide tooltip if no data
            },
          ),
        ),
        barGroups: _chartGroups(),
        borderData: FlBorderData(border: const Border()),
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: _bottomTitles,
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    return widget.bars
        .map((bar) => BarChartGroupData(
              x: bar.x,
              barRods: [
                BarChartRodData(
                  color: Color(0xFF98B5FF),
                  toY: bar.y,
                )
              ],
            ))
        .toList();
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 40,
        getTitlesWidget: (value, titleMeta) {
          // Assuming your x values are integers and represent indices.
          int years = value.toInt();
          DateTime now = DateTime.now();
          int currentYear = now.year;
          if (years >= currentYear &&
              years % getXIntervals(widget.yearsToGrow) == 0) {
            // Fetching the x value from the IndividualBar object.
            return Text(
              years.toString(),
              style: TextStyle(
                height: 3,
                color: Colors.white,
              ),
            );
          } else {
            return Text('');
          }
        },
      );

  SideTitles get _leftTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, titleMeta) {
          // List<int> xValues = calculateInterval();
          // Assuming your x values are integers and represent indices.
          int amount = value.toInt();
          if (amount % 4 == 0) {
            // Fetching the x value from the IndividualBar object.
            return Text(amount.toString());
          } else {
            return Text('');
          }
        },
      );
}

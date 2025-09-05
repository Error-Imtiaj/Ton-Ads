import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeeklyCoinChart extends StatelessWidget {
  // Previous 3 days + today
  final List<double> coinData = [10, 20, 15, 30];

   WeeklyCoinChart({super.key}); // previous 3 + today

  // Function to generate 7-day titles with today in the middle (index 3)
  List<String> getWeekTitles() {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    int todayIndex = DateTime.now().weekday % 7; // Sun=0, Mon=1,... Sat=6

    // Previous 3 days
    List<String> previousDays = List.generate(
      3,
      (i) => days[(todayIndex - 3 + i + 7) % 7],
    );

    // Today
    String today = days[todayIndex];

    // Next 3 days
    List<String> nextDays = List.generate(
      3,
      (i) => days[(todayIndex + i + 1) % 7],
    );

    return [...previousDays, today, ...nextDays];
  }

  @override
  Widget build(BuildContext context) {
    // Fill missing data with 0 for future days
    List<double> weeklyCoins = List.from(coinData);
    while (weeklyCoins.length < 7) {
      weeklyCoins.add(0);
    }

    List<String> titles = getWeekTitles();

    // Generate FlSpots only for non-zero values
    List<FlSpot> spots = [];
    for (int i = 0; i < weeklyCoins.length; i++) {
      if (weeklyCoins[i] > 0) {
        spots.add(FlSpot(i.toDouble(), weeklyCoins[i]));
      }
    }

    return SizedBox(
      height: 230.r,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: (weeklyCoins.reduce((a, b) => a > b ? a : b)) + 10,

          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  if (index >= 0 && index < titles.length) {
                    if (index == 3) {
                      return Text(
                        titles[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      );
                    }
                    return Text(titles[index]);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),

          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            drawHorizontalLine: true,
            verticalInterval: 1,
            horizontalInterval: 10,
            getDrawingHorizontalLine: (value) =>
                FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 1),
            getDrawingVerticalLine: (value) =>
                FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 1),
          ),

          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey, width: 1),
          ),

          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              barWidth: 3,
              dotData: FlDotData(show: true),
              color: Colors.blue,
              isStrokeCapRound: true,
            ),
          ],
        ),
      ),
    );
  }
}

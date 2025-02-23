import 'package:flutter/material.dart';
import 'package:montra/themes/theme.dart';
import 'package:montra/utils/index.dart';
import 'package:fl_chart/fl_chart.dart';

class ChatCard extends StatefulWidget {
  const ChatCard({super.key});

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  Widget get tilte {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 12),
      child: Text(
        Utils.i18n(context, "home.spendFrequency"),
        style: theme.font.title3.copyWith(color: theme.color.dark100),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: theme.color.violet100,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                theme.color.violet100.withValues(alpha: 0.24),
                theme.color.violet100.withValues(alpha: 0)
              ],
              stops: const [0.1, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

  Widget get chart {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 186,
      child: LineChart(mainData()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tilte,
          chart,
        ],
      ),
    );
  }
}

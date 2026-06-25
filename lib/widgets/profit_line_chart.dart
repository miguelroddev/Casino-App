import 'package:casino_app/core/player/player.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProfitLineChart extends StatelessWidget {
  final Player player;

  const ProfitLineChart({
    super.key,
    required this.player,
  });

  List<FlSpot> _createSpots() {
    final entries = player.dailyProfit.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    double total = 0;

    return entries.map((entry) {
      total += entry.value;
      return FlSpot(entry.key.toDouble(), total);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final spots = _createSpots();

    if (spots.isEmpty) {
      return const SizedBox(
        height: 250,
        child: Center(
          child: Text('No profit data yet'),
        ),
      );
    }

    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          minX: spots.first.x,
          maxX: spots.last.x,

          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: false,
              color: const Color(0xFFFFBB00),
              barWidth: 3,
              dotData: const FlDotData(show: true),
            ),
          ],

          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              axisNameWidget: const Text(
                "Day",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              axisNameSize: 28,
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  if (value != value.roundToDouble()) {
                    return const SizedBox.shrink();
                  }

                  return SideTitleWidget(
                    meta: meta,
                    child: Text(
                      value.toInt().toString(),
                    ),
                  );
                },
              ),
            ),
            leftTitles: const AxisTitles(
              axisNameWidget: Text(
                'Profit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              axisNameSize: 30,
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 42,
              ),
            ),
          ),

          borderData: FlBorderData(show: true),
          gridData: FlGridData(
            show: true,
            verticalInterval: 1,
          ),
        ),
      ),
    );
  }
}
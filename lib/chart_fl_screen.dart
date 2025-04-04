import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';

class ChartFlScreen extends StatefulWidget {
  ChartFlScreen({super.key});

  final Color dark = Colors.black;
  final Color normal = Colors.green;
  final Color light = Colors.red;

  @override
  State<StatefulWidget> createState() => ChartFlScreenState();
}

class ChartFlScreenState extends State<ChartFlScreen> {
  Widget bottomTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      color: Colors.green,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Sun';
        break;
      case 1:
        text = 'Mon';
        break;
      case 2:
        text = 'Tue';
        break;
      case 3:
        text = 'Wed';
        break;
      case 4:
        text = 'Thu';
      case 5:
        text = 'fri';
      case 6:
        text = 'Sat';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(meta: meta, child: Text(text, style: style));
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Text('${value}');
    }

    return SideTitleWidget(meta: meta, child: Text(meta.formattedValue));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightGreen,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Touchpoint Activity', textAlign: TextAlign.center),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.purpleAccent,
                    ),
                    Text('3/24/2025', textAlign: TextAlign.center),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.purpleAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1.66,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final barsSpace = 4.0 * constraints.maxWidth / 400;
                  final barsWidth = 8.0 * constraints.maxWidth / 400;
                  return BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.center,
                      barTouchData: BarTouchData(enabled: true),
                      borderData: FlBorderData(
                        show: true, // Show the border completely
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 28,
                            getTitlesWidget: bottomTitles,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: leftTitles,
                          ),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        checkToShowHorizontalLine:
                            (value) => true, // Show line for every value
                        getDrawingHorizontalLine:
                            (value) => FlLine(
                              color: Colors.white.withValues(alpha: 1),
                              strokeWidth: 1,
                              dashArray: [
                                3,
                                3,
                              ], // Defines a dashed pattern (5px dash, 5px gap)
                            ),
                        drawVerticalLine: false,
                      ),
                      // borderData: FlBorderData(
                      //   show: false,
                      // ),
                      groupsSpace: 25,
                      barGroups: getData(17, barsSpace),
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(radius: 4, backgroundColor: Colors.white),
              ),
              Text('Completed'),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(radius: 4, backgroundColor: Colors.green),
              ),
              Text('No touchpoint'),
            ],
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 1000,
        barRods: [
          BarChartRodData(
            color: Colors.red,
            toY: 9.9,
            rodStackItems: [
              BarChartRodStackItem(0, 3, Colors.white),
              BarChartRodStackItem(3, 4, Colors.grey),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            color: Colors.red,
            toY: 3,
            rodStackItems: [BarChartRodStackItem(0, 2, Colors.white)],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            color: Colors.green,
            toY: .5,
            rodStackItems: [BarChartRodStackItem(0, 4, Colors.green)],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            color: Colors.yellow,
            toY: 4,
            rodStackItems: [BarChartRodStackItem(0, 3, Colors.teal)],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            color: Colors.green,
            toY: 1.5,
            rodStackItems: [BarChartRodStackItem(0, 4, Colors.green)],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            color: Colors.green,
            toY: 4,
            rodStackItems: [BarChartRodStackItem(0, 4, Colors.green)],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            color: Colors.green,
            toY: 5.5,
            rodStackItems: [BarChartRodStackItem(0, 2, Colors.white)],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            width: barsWidth,
          ),
        ],
      ),
    ];
  }
}

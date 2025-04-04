import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart'; // For compact number format (e.g. 20M)

// Data model class for sales data
class SalesData {
  final String brand;
  final int sales;

  SalesData(this.brand, this.sales);
}

class ChartSyncfusionScreen extends StatelessWidget {
  // Sample data
  final List<SalesData> chartData = [
    SalesData('BMW', 160),
    SalesData('Audi', 100),
    SalesData('Honda', 130),
    SalesData('Ferrari', 110),
    SalesData('Hondaa', 100),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Sales Chart',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Car Sales Chart'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 300,

            child: SfCartesianChart(
              title: ChartTitle(text: 'Car Brand Sales'),
              tooltipBehavior: TooltipBehavior(enable: false),
              primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Brand')),
              primaryYAxis: NumericAxis(
                title: AxisTitle(text: 'Sales in'),
                numberFormat: NumberFormat.compact(),
              ),
              series: <CartesianSeries<SalesData, String>>[
                ColumnSeries<SalesData, String>(
                  dataSource: chartData,
                  xValueMapper: (SalesData data, _) => data.brand,
                  yValueMapper: (SalesData data, _) => data.sales,
                  name: 'Sales',
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  color: Colors.teal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

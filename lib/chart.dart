import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'utils/helper.dart';

class WeatherChart extends StatelessWidget {
  Widget build(BuildContext context) {
    return BezierChart(
      bezierChartScale: BezierChartScale.CUSTOM,
      xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
      footerValueBuilder: (double value) {
        return "${value}\ndays";
      },
      series: const [
        BezierLine(
          lineStrokeWidth: 2.0,
          lineColor: Color(0xfff4a875),
          label: "m",
          data: const [
            DataPoint<double>(value: 10, xAxis: 0),
            DataPoint<double>(value: 130, xAxis: 5),
            DataPoint<double>(value: 50, xAxis: 10),
            DataPoint<double>(value: 150, xAxis: 15),
            DataPoint<double>(value: 75, xAxis: 20),
            DataPoint<double>(value: 0, xAxis: 25),
            DataPoint<double>(value: 5, xAxis: 30),
            DataPoint<double>(value: 45, xAxis: 35),
          ],
        ),
        BezierLine(
          lineStrokeWidth: 2.0,
          lineColor: Color(0xff80bfe1),
          label: "m",
          data: const [
            DataPoint<double>(value: 1, xAxis: 0),
            DataPoint<double>(value: 80, xAxis: 5),
            DataPoint<double>(value: 40, xAxis: 10),
            DataPoint<double>(value: 110, xAxis: 15),
            DataPoint<double>(value: 20, xAxis: 20),
            DataPoint<double>(value: 0, xAxis: 25),
            DataPoint<double>(value: 2, xAxis: 30),
            DataPoint<double>(value: 20, xAxis: 35),
          ],
        ),
      ],
      config: BezierChartConfig(
        // footerHeight: 40,
        verticalIndicatorStrokeWidth: 1.0,
        verticalIndicatorColor: textColor,
        showVerticalIndicator: true,
        verticalIndicatorFixedPosition: false,
        showDataPoints: false,
        // snap: false,
      ),
    );
  }
}
